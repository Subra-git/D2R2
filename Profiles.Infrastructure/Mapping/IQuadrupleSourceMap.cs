namespace Profiles.Infrastructure.Mapping
{
    public interface IQuadrupleSourceMap<in TSource1, in TSource2, in TSource3, in TSource4, out TTarget>
    {
        TTarget Map(TSource1 source1, TSource2 source2, TSource3 source3, TSource4 source4);
    }
}
