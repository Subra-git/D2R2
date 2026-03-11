using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Profiles.DiffMatchPatch;

namespace Profiles.DiffMatchPatch.Interfaces
{
    public interface IdiffMatchPatchService
    {

         List<Diff> getDifferences(string text1, string text2);

         void diffCleanUp(List<Diff> diffs);
    }
}
