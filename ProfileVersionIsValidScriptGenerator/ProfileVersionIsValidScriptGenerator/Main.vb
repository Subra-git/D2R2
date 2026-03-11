Imports ProfilesLibrary

Module Main

    Private mOutput As System.Text.StringBuilder
    Private mSectionList As ProfileSectionInfoList
    Private mCurrentProfileVersionSection As ProfileVersionSection
    Private mCount As Integer

    Sub Main()

        If Not ProfilesPrincipal.Login(Environment.UserDomainName & "\" & Environment.UserName) Then
            Console.WriteLine("You are not authorized to use this application.")
            Console.ReadKey()
            Exit Sub
        End If

        mOutput = New System.Text.StringBuilder()

        mSectionList = ProfileSectionInfoList.GetList()

        Dim currentPublishedList As ProfileVersionInfoList = ProfileVersionInfoList.GetCurrentPublished()
        For Each currentPublishedProfile As ProfileVersionInfo In currentPublishedList
            Dim publishedVersionList As ProfileVersionInfoList = ProfileVersionInfoList.GetPublishedHistory(currentPublishedProfile.ProfileId)
            HandleVersionList(publishedVersionList)
            If currentPublishedProfile.IsLatestVersion Then
                Dim draftVersionList As ProfileVersionInfoList = ProfileVersionInfoList.GetDraftHistory(currentPublishedProfile.ProfileId)
                HandleVersionList(draftVersionList)
            End If
        Next

        Dim currentDraftList As ProfileVersionInfoList = ProfileVersionInfoList.GetCurrentDraft()
        For Each currentDraftProfile As ProfileVersionInfo In currentDraftList
            Dim draftVersionList As ProfileVersionInfoList = ProfileVersionInfoList.GetDraftHistory(currentDraftProfile.ProfileId)
            HandleVersionList(draftVersionList)
        Next

        mOutput.AppendLine().AppendLine("GO").AppendLine()

        Console.Write(mOutput.ToString())
        'Console.ReadKey()

    End Sub

    Private Sub HandleVersionList(ByVal versionList As ProfileVersionInfoList)

        For Each currentPublishedVersion As ProfileVersionInfo In versionList
            mCount += 1
            For Each section As ProfileSectionInfo In mSectionList
                mCurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(currentPublishedVersion.Id, section.Id)
                mOutput.AppendLine("UPDATE [ProfileVersionSection]")
                mOutput.Append("SET [IsValid] = ")
                If mCurrentProfileVersionSection.Validate().Count = 0 Then
                    mOutput.AppendLine("1")
                Else
                    mOutput.AppendLine("0")
                End If
                mOutput.AppendLine(String.Format("WHERE [ProfileVersionId] = '{0}' AND [ProfileSectionId] = '{1}'", mCurrentProfileVersionSection.ProfileVersionId.ToString(), mCurrentProfileVersionSection.ProfileSectionId.ToString())).AppendLine()
            Next
        Next

    End Sub
End Module
