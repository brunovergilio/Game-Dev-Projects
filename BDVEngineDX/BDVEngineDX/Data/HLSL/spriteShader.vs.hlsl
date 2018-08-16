cbuffer cbPerObject : register(b0)
{
    float4x4 gProjMatrix;
    float2 gTextureInfo;
};

struct VertexIn
{
    float3 position : POSITION;
    float2 tex      : TEXCOORD0;
    float4 color    : COLOR;
};

struct VertexOut
{
    float4 posH   : SV_POSITION;
    float2 tex    : TEXCOORD0;
    float4 color  : COLOR;
};

VertexOut VS(VertexIn vin)
{
    VertexOut vout;

    vout.color = vin.color;

    vout.tex.x = vin.tex.x / gTextureInfo.x;
    vout.tex.y = vin.tex.y / gTextureInfo.y;

    vout.posH = mul(gProjMatrix, float4(vin.position, 1.0f));
    
    return vout;
}