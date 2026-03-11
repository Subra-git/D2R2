using Profiles.DiffMatchPatch.Interfaces;
using System.Collections.Generic;
using Profiles.DiffMatchPatch;
using System;

namespace Profiles.DiffMatchPatch
{
    public class DiffMatchPatchService : diff_match_patch, IdiffMatchPatchService
    {
        private diff_match_patch _service;

        public DiffMatchPatchService()
        {
            _service = new diff_match_patch();
        }

        public void diffCleanUp(List<Diff> diffs)
        {
            _service.diff_cleanupSemantic(diffs);
        }

        public List<Diff> getDifferences(string text1, string text2)
        {
            return _service.diff_main(text1, text2);
        }
    }
}
