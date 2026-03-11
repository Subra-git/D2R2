namespace Profiles.Infrastructure.Mapping
{
    public interface IDoubleSourceMap<in TSource1, in TSource2, out TTarget>
    {
        TTarget Map(TSource1 source1, TSource2 source2);
    }
}
