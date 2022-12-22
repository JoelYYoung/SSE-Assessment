; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @staticReturnsTrue(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !22
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !25
  %tobool2 = icmp ne i32 %call1, 0, !dbg !25
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !27

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !36
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !36
  %1 = load i32, i32* %data, align 4, !dbg !37
  %cmp = icmp sge i32 %1, 0, !dbg !39
  br i1 %cmp, label %if.then4, label %if.else, !dbg !40

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !41
  %idxprom = sext i32 %2 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  store i32 1, i32* %arrayidx, align 4, !dbg !44
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !48
  %cmp5 = icmp slt i32 %3, 10, !dbg !50
  br i1 %cmp5, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !52
  %idxprom6 = sext i32 %4 to i64, !dbg !54
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !54
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !54
  call void @printIntLine(i32 %5), !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %6, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !62

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !63
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !65

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08_good() #0 !dbg !67 {
entry:
  call void @goodB2G1(), !dbg !68
  call void @goodB2G2(), !dbg !69
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !93 {
entry:
  ret i32 1, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  %call = call i32 @staticReturnsTrue(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !104
  br label %if.end, !dbg !106

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !107
  %tobool2 = icmp ne i32 %call1, 0, !dbg !107
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !109

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  br label %if.end11, !dbg !112

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !118
  %1 = load i32, i32* %data, align 4, !dbg !119
  %cmp = icmp sge i32 %1, 0, !dbg !121
  br i1 %cmp, label %land.lhs.true, label %if.else9, !dbg !122

land.lhs.true:                                    ; preds = %if.else
  %2 = load i32, i32* %data, align 4, !dbg !123
  %cmp4 = icmp slt i32 %2, 10, !dbg !124
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !125

if.then5:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !126
  %idxprom = sext i32 %3 to i64, !dbg !128
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !128
  store i32 1, i32* %arrayidx, align 4, !dbg !129
  store i32 0, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.then5
  %4 = load i32, i32* %i, align 4, !dbg !133
  %cmp6 = icmp slt i32 %4, 10, !dbg !135
  br i1 %cmp6, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !137
  %idxprom7 = sext i32 %5 to i64, !dbg !139
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !139
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !139
  call void @printIntLine(i32 %6), !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !142
  %inc = add nsw i32 %7, 1, !dbg !142
  store i32 %inc, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !146

if.else9:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then3
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !150 {
entry:
  ret i32 0, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !152 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 -1, i32* %data, align 4, !dbg !155
  %call = call i32 @staticReturnsTrue(), !dbg !156
  %tobool = icmp ne i32 %call, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !159
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !162
  %tobool2 = icmp ne i32 %call1, 0, !dbg !162
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !164

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !170
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !170
  %1 = load i32, i32* %data, align 4, !dbg !171
  %cmp = icmp sge i32 %1, 0, !dbg !173
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !174

land.lhs.true:                                    ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !175
  %cmp4 = icmp slt i32 %2, 10, !dbg !176
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !177

if.then5:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !178
  %idxprom = sext i32 %3 to i64, !dbg !180
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !180
  store i32 1, i32* %arrayidx, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.then5
  %4 = load i32, i32* %i, align 4, !dbg !185
  %cmp6 = icmp slt i32 %4, 10, !dbg !187
  br i1 %cmp6, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !189
  %idxprom7 = sext i32 %5 to i64, !dbg !191
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !191
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !191
  call void @printIntLine(i32 %6), !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %7, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !198

if.else:                                          ; preds = %land.lhs.true, %if.then3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !199
  br label %if.end9

if.end9:                                          ; preds = %if.else, %for.end
  br label %if.end10, !dbg !201

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  %call = call i32 @staticReturnsFalse(), !dbg !207
  %tobool = icmp ne i32 %call, 0, !dbg !207
  br i1 %tobool, label %if.then, label %if.else, !dbg !209

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !210
  br label %if.end, !dbg !212

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !213
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !215
  %tobool2 = icmp ne i32 %call1, 0, !dbg !215
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !217

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !218, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !223
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !223
  %1 = load i32, i32* %data, align 4, !dbg !224
  %cmp = icmp sge i32 %1, 0, !dbg !226
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !227

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !228
  %idxprom = sext i32 %2 to i64, !dbg !230
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !230
  store i32 1, i32* %arrayidx, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !235
  %cmp5 = icmp slt i32 %3, 10, !dbg !237
  br i1 %cmp5, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !239
  %idxprom6 = sext i32 %4 to i64, !dbg !241
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !241
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !241
  call void @printIntLine(i32 %5), !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %6, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !245, !llvm.loop !246

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !248

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !249
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !251

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !252
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !253 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 -1, i32* %data, align 4, !dbg !256
  %call = call i32 @staticReturnsTrue(), !dbg !257
  %tobool = icmp ne i32 %call, 0, !dbg !257
  br i1 %tobool, label %if.then, label %if.end, !dbg !259

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !260
  br label %if.end, !dbg !262

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !263
  %tobool2 = icmp ne i32 %call1, 0, !dbg !263
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !265

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !266, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !270, metadata !DIExpression()), !dbg !271
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !271
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !271
  %1 = load i32, i32* %data, align 4, !dbg !272
  %cmp = icmp sge i32 %1, 0, !dbg !274
  br i1 %cmp, label %if.then4, label %if.else, !dbg !275

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !276
  %idxprom = sext i32 %2 to i64, !dbg !278
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !278
  store i32 1, i32* %arrayidx, align 4, !dbg !279
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !282

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !283
  %cmp5 = icmp slt i32 %3, 10, !dbg !285
  br i1 %cmp5, label %for.body, label %for.end, !dbg !286

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !287
  %idxprom6 = sext i32 %4 to i64, !dbg !289
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !289
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !289
  call void @printIntLine(i32 %5), !dbg !290
  br label %for.inc, !dbg !291

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !292
  %inc = add nsw i32 %6, 1, !dbg !292
  store i32 %inc, i32* %i, align 4, !dbg !292
  br label %for.cond, !dbg !293, !llvm.loop !294

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !296

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !297
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !299

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !300
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 37, column: 9, scope: !11)
!18 = !DILocation(line: 39, column: 10, scope: !11)
!19 = !DILocation(line: 40, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!21 = !DILocation(line: 40, column: 8, scope: !11)
!22 = !DILocation(line: 43, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!24 = !DILocation(line: 44, column: 5, scope: !23)
!25 = !DILocation(line: 45, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 8)
!27 = !DILocation(line: 45, column: 8, scope: !11)
!28 = !DILocalVariable(name: "i", scope: !29, file: !12, line: 48, type: !16)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 47, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !12, line: 46, column: 5)
!31 = !DILocation(line: 48, column: 17, scope: !29)
!32 = !DILocalVariable(name: "buffer", scope: !29, file: !12, line: 49, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 49, column: 17, scope: !29)
!37 = !DILocation(line: 52, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 52, column: 17)
!39 = !DILocation(line: 52, column: 22, scope: !38)
!40 = !DILocation(line: 52, column: 17, scope: !29)
!41 = !DILocation(line: 54, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 53, column: 13)
!43 = !DILocation(line: 54, column: 17, scope: !42)
!44 = !DILocation(line: 54, column: 30, scope: !42)
!45 = !DILocation(line: 56, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 56, column: 17)
!47 = !DILocation(line: 56, column: 21, scope: !46)
!48 = !DILocation(line: 56, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 56, column: 17)
!50 = !DILocation(line: 56, column: 30, scope: !49)
!51 = !DILocation(line: 56, column: 17, scope: !46)
!52 = !DILocation(line: 58, column: 41, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 57, column: 17)
!54 = !DILocation(line: 58, column: 34, scope: !53)
!55 = !DILocation(line: 58, column: 21, scope: !53)
!56 = !DILocation(line: 59, column: 17, scope: !53)
!57 = !DILocation(line: 56, column: 37, scope: !49)
!58 = !DILocation(line: 56, column: 17, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 59, column: 17, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 60, column: 13, scope: !42)
!63 = !DILocation(line: 63, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !38, file: !12, line: 62, column: 13)
!65 = !DILocation(line: 66, column: 5, scope: !30)
!66 = !DILocation(line: 67, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_08_good", scope: !12, file: !12, line: 223, type: !13, scopeLine: 224, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 225, column: 5, scope: !67)
!69 = !DILocation(line: 226, column: 5, scope: !67)
!70 = !DILocation(line: 227, column: 5, scope: !67)
!71 = !DILocation(line: 228, column: 5, scope: !67)
!72 = !DILocation(line: 229, column: 1, scope: !67)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 240, type: !74, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!16, !16, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 240, type: !16)
!80 = !DILocation(line: 240, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 240, type: !76)
!82 = !DILocation(line: 240, column: 27, scope: !73)
!83 = !DILocation(line: 243, column: 22, scope: !73)
!84 = !DILocation(line: 243, column: 12, scope: !73)
!85 = !DILocation(line: 243, column: 5, scope: !73)
!86 = !DILocation(line: 245, column: 5, scope: !73)
!87 = !DILocation(line: 246, column: 5, scope: !73)
!88 = !DILocation(line: 247, column: 5, scope: !73)
!89 = !DILocation(line: 250, column: 5, scope: !73)
!90 = !DILocation(line: 251, column: 5, scope: !73)
!91 = !DILocation(line: 252, column: 5, scope: !73)
!92 = !DILocation(line: 254, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !94, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!16}
!96 = !DILocation(line: 25, column: 5, scope: !93)
!97 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 76, type: !16)
!99 = !DILocation(line: 76, column: 9, scope: !97)
!100 = !DILocation(line: 78, column: 10, scope: !97)
!101 = !DILocation(line: 79, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !12, line: 79, column: 8)
!103 = !DILocation(line: 79, column: 8, scope: !97)
!104 = !DILocation(line: 82, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 80, column: 5)
!106 = !DILocation(line: 83, column: 5, scope: !105)
!107 = !DILocation(line: 84, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !12, line: 84, column: 8)
!109 = !DILocation(line: 84, column: 8, scope: !97)
!110 = !DILocation(line: 87, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 85, column: 5)
!112 = !DILocation(line: 88, column: 5, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 92, type: !16)
!114 = distinct !DILexicalBlock(scope: !115, file: !12, line: 91, column: 9)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 90, column: 5)
!116 = !DILocation(line: 92, column: 17, scope: !114)
!117 = !DILocalVariable(name: "buffer", scope: !114, file: !12, line: 93, type: !33)
!118 = !DILocation(line: 93, column: 17, scope: !114)
!119 = !DILocation(line: 95, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !12, line: 95, column: 17)
!121 = !DILocation(line: 95, column: 22, scope: !120)
!122 = !DILocation(line: 95, column: 27, scope: !120)
!123 = !DILocation(line: 95, column: 30, scope: !120)
!124 = !DILocation(line: 95, column: 35, scope: !120)
!125 = !DILocation(line: 95, column: 17, scope: !114)
!126 = !DILocation(line: 97, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !12, line: 96, column: 13)
!128 = !DILocation(line: 97, column: 17, scope: !127)
!129 = !DILocation(line: 97, column: 30, scope: !127)
!130 = !DILocation(line: 99, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 99, column: 17)
!132 = !DILocation(line: 99, column: 21, scope: !131)
!133 = !DILocation(line: 99, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 99, column: 17)
!135 = !DILocation(line: 99, column: 30, scope: !134)
!136 = !DILocation(line: 99, column: 17, scope: !131)
!137 = !DILocation(line: 101, column: 41, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 100, column: 17)
!139 = !DILocation(line: 101, column: 34, scope: !138)
!140 = !DILocation(line: 101, column: 21, scope: !138)
!141 = !DILocation(line: 102, column: 17, scope: !138)
!142 = !DILocation(line: 99, column: 37, scope: !134)
!143 = !DILocation(line: 99, column: 17, scope: !134)
!144 = distinct !{!144, !136, !145, !61}
!145 = !DILocation(line: 102, column: 17, scope: !131)
!146 = !DILocation(line: 103, column: 13, scope: !127)
!147 = !DILocation(line: 106, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !120, file: !12, line: 105, column: 13)
!149 = !DILocation(line: 110, column: 1, scope: !97)
!150 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !94, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocation(line: 30, column: 5, scope: !150)
!152 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !12, line: 115, type: !16)
!154 = !DILocation(line: 115, column: 9, scope: !152)
!155 = !DILocation(line: 117, column: 10, scope: !152)
!156 = !DILocation(line: 118, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 118, column: 8)
!158 = !DILocation(line: 118, column: 8, scope: !152)
!159 = !DILocation(line: 121, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 119, column: 5)
!161 = !DILocation(line: 122, column: 5, scope: !160)
!162 = !DILocation(line: 123, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !152, file: !12, line: 123, column: 8)
!164 = !DILocation(line: 123, column: 8, scope: !152)
!165 = !DILocalVariable(name: "i", scope: !166, file: !12, line: 126, type: !16)
!166 = distinct !DILexicalBlock(scope: !167, file: !12, line: 125, column: 9)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 124, column: 5)
!168 = !DILocation(line: 126, column: 17, scope: !166)
!169 = !DILocalVariable(name: "buffer", scope: !166, file: !12, line: 127, type: !33)
!170 = !DILocation(line: 127, column: 17, scope: !166)
!171 = !DILocation(line: 129, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !12, line: 129, column: 17)
!173 = !DILocation(line: 129, column: 22, scope: !172)
!174 = !DILocation(line: 129, column: 27, scope: !172)
!175 = !DILocation(line: 129, column: 30, scope: !172)
!176 = !DILocation(line: 129, column: 35, scope: !172)
!177 = !DILocation(line: 129, column: 17, scope: !166)
!178 = !DILocation(line: 131, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !12, line: 130, column: 13)
!180 = !DILocation(line: 131, column: 17, scope: !179)
!181 = !DILocation(line: 131, column: 30, scope: !179)
!182 = !DILocation(line: 133, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !12, line: 133, column: 17)
!184 = !DILocation(line: 133, column: 21, scope: !183)
!185 = !DILocation(line: 133, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !12, line: 133, column: 17)
!187 = !DILocation(line: 133, column: 30, scope: !186)
!188 = !DILocation(line: 133, column: 17, scope: !183)
!189 = !DILocation(line: 135, column: 41, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !12, line: 134, column: 17)
!191 = !DILocation(line: 135, column: 34, scope: !190)
!192 = !DILocation(line: 135, column: 21, scope: !190)
!193 = !DILocation(line: 136, column: 17, scope: !190)
!194 = !DILocation(line: 133, column: 37, scope: !186)
!195 = !DILocation(line: 133, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !61}
!197 = !DILocation(line: 136, column: 17, scope: !183)
!198 = !DILocation(line: 137, column: 13, scope: !179)
!199 = !DILocation(line: 140, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !172, file: !12, line: 139, column: 13)
!201 = !DILocation(line: 143, column: 5, scope: !167)
!202 = !DILocation(line: 144, column: 1, scope: !152)
!203 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 147, type: !13, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "data", scope: !203, file: !12, line: 149, type: !16)
!205 = !DILocation(line: 149, column: 9, scope: !203)
!206 = !DILocation(line: 151, column: 10, scope: !203)
!207 = !DILocation(line: 152, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !12, line: 152, column: 8)
!209 = !DILocation(line: 152, column: 8, scope: !203)
!210 = !DILocation(line: 155, column: 9, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !12, line: 153, column: 5)
!212 = !DILocation(line: 156, column: 5, scope: !211)
!213 = !DILocation(line: 161, column: 14, scope: !214)
!214 = distinct !DILexicalBlock(scope: !208, file: !12, line: 158, column: 5)
!215 = !DILocation(line: 163, column: 8, scope: !216)
!216 = distinct !DILexicalBlock(scope: !203, file: !12, line: 163, column: 8)
!217 = !DILocation(line: 163, column: 8, scope: !203)
!218 = !DILocalVariable(name: "i", scope: !219, file: !12, line: 166, type: !16)
!219 = distinct !DILexicalBlock(scope: !220, file: !12, line: 165, column: 9)
!220 = distinct !DILexicalBlock(scope: !216, file: !12, line: 164, column: 5)
!221 = !DILocation(line: 166, column: 17, scope: !219)
!222 = !DILocalVariable(name: "buffer", scope: !219, file: !12, line: 167, type: !33)
!223 = !DILocation(line: 167, column: 17, scope: !219)
!224 = !DILocation(line: 170, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !219, file: !12, line: 170, column: 17)
!226 = !DILocation(line: 170, column: 22, scope: !225)
!227 = !DILocation(line: 170, column: 17, scope: !219)
!228 = !DILocation(line: 172, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !12, line: 171, column: 13)
!230 = !DILocation(line: 172, column: 17, scope: !229)
!231 = !DILocation(line: 172, column: 30, scope: !229)
!232 = !DILocation(line: 174, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !12, line: 174, column: 17)
!234 = !DILocation(line: 174, column: 21, scope: !233)
!235 = !DILocation(line: 174, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !12, line: 174, column: 17)
!237 = !DILocation(line: 174, column: 30, scope: !236)
!238 = !DILocation(line: 174, column: 17, scope: !233)
!239 = !DILocation(line: 176, column: 41, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !12, line: 175, column: 17)
!241 = !DILocation(line: 176, column: 34, scope: !240)
!242 = !DILocation(line: 176, column: 21, scope: !240)
!243 = !DILocation(line: 177, column: 17, scope: !240)
!244 = !DILocation(line: 174, column: 37, scope: !236)
!245 = !DILocation(line: 174, column: 17, scope: !236)
!246 = distinct !{!246, !238, !247, !61}
!247 = !DILocation(line: 177, column: 17, scope: !233)
!248 = !DILocation(line: 178, column: 13, scope: !229)
!249 = !DILocation(line: 181, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !225, file: !12, line: 180, column: 13)
!251 = !DILocation(line: 184, column: 5, scope: !220)
!252 = !DILocation(line: 185, column: 1, scope: !203)
!253 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 188, type: !13, scopeLine: 189, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!254 = !DILocalVariable(name: "data", scope: !253, file: !12, line: 190, type: !16)
!255 = !DILocation(line: 190, column: 9, scope: !253)
!256 = !DILocation(line: 192, column: 10, scope: !253)
!257 = !DILocation(line: 193, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !12, line: 193, column: 8)
!259 = !DILocation(line: 193, column: 8, scope: !253)
!260 = !DILocation(line: 197, column: 14, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !12, line: 194, column: 5)
!262 = !DILocation(line: 198, column: 5, scope: !261)
!263 = !DILocation(line: 199, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !253, file: !12, line: 199, column: 8)
!265 = !DILocation(line: 199, column: 8, scope: !253)
!266 = !DILocalVariable(name: "i", scope: !267, file: !12, line: 202, type: !16)
!267 = distinct !DILexicalBlock(scope: !268, file: !12, line: 201, column: 9)
!268 = distinct !DILexicalBlock(scope: !264, file: !12, line: 200, column: 5)
!269 = !DILocation(line: 202, column: 17, scope: !267)
!270 = !DILocalVariable(name: "buffer", scope: !267, file: !12, line: 203, type: !33)
!271 = !DILocation(line: 203, column: 17, scope: !267)
!272 = !DILocation(line: 206, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !267, file: !12, line: 206, column: 17)
!274 = !DILocation(line: 206, column: 22, scope: !273)
!275 = !DILocation(line: 206, column: 17, scope: !267)
!276 = !DILocation(line: 208, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !12, line: 207, column: 13)
!278 = !DILocation(line: 208, column: 17, scope: !277)
!279 = !DILocation(line: 208, column: 30, scope: !277)
!280 = !DILocation(line: 210, column: 23, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !12, line: 210, column: 17)
!282 = !DILocation(line: 210, column: 21, scope: !281)
!283 = !DILocation(line: 210, column: 28, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !12, line: 210, column: 17)
!285 = !DILocation(line: 210, column: 30, scope: !284)
!286 = !DILocation(line: 210, column: 17, scope: !281)
!287 = !DILocation(line: 212, column: 41, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !12, line: 211, column: 17)
!289 = !DILocation(line: 212, column: 34, scope: !288)
!290 = !DILocation(line: 212, column: 21, scope: !288)
!291 = !DILocation(line: 213, column: 17, scope: !288)
!292 = !DILocation(line: 210, column: 37, scope: !284)
!293 = !DILocation(line: 210, column: 17, scope: !284)
!294 = distinct !{!294, !286, !295, !61}
!295 = !DILocation(line: 213, column: 17, scope: !281)
!296 = !DILocation(line: 214, column: 13, scope: !277)
!297 = !DILocation(line: 217, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !273, file: !12, line: 216, column: 13)
!299 = !DILocation(line: 220, column: 5, scope: !268)
!300 = !DILocation(line: 221, column: 1, scope: !253)
