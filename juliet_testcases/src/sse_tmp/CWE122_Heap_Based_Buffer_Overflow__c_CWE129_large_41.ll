; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  store i32 10, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* %data, align 4, !dbg !22
  call void @badSink(i32 %0), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !25 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !33, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !35
  %0 = bitcast i8* %call to i32*, !dbg !36
  store i32* %0, i32** %buffer, align 8, !dbg !34
  %1 = load i32*, i32** %buffer, align 8, !dbg !37
  %cmp = icmp eq i32* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !46
  %cmp1 = icmp slt i32 %2, 10, !dbg !48
  br i1 %cmp1, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !50
  %4 = load i32, i32* %i, align 4, !dbg !52
  %idxprom = sext i32 %4 to i64, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !55
  %inc = add nsw i32 %5, 1, !dbg !55
  store i32 %inc, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !60
  %cmp2 = icmp sge i32 %6, 0, !dbg !62
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !63

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !64
  %8 = load i32, i32* %data.addr, align 4, !dbg !66
  %idxprom4 = sext i32 %8 to i64, !dbg !64
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !64
  store i32 1, i32* %arrayidx5, align 4, !dbg !67
  store i32 0, i32* %i, align 4, !dbg !68
  br label %for.cond6, !dbg !70

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !71
  %cmp7 = icmp slt i32 %9, 10, !dbg !73
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !74

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !75
  %11 = load i32, i32* %i, align 4, !dbg !77
  %idxprom9 = sext i32 %11 to i64, !dbg !75
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !75
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !75
  call void @printIntLine(i32 %12), !dbg !78
  br label %for.inc11, !dbg !79

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !80
  %inc12 = add nsw i32 %13, 1, !dbg !80
  store i32 %inc12, i32* %i, align 4, !dbg !80
  br label %for.cond6, !dbg !81, !llvm.loop !82

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !84

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !87
  %15 = bitcast i32* %14 to i8*, !dbg !87
  call void @free(i8* %15) #5, !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_good() #0 !dbg !90 {
entry:
  call void @goodB2G(), !dbg !91
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #5, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #5, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  store i32 10, i32* %data, align 4, !dbg !118
  %0 = load i32, i32* %data, align 4, !dbg !119
  call void @goodB2GSink(i32 %0), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !122 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !130
  %0 = bitcast i8* %call to i32*, !dbg !131
  store i32* %0, i32** %buffer, align 8, !dbg !129
  %1 = load i32*, i32** %buffer, align 8, !dbg !132
  %cmp = icmp eq i32* %1, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !141
  %cmp1 = icmp slt i32 %2, 10, !dbg !143
  br i1 %cmp1, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !145
  %4 = load i32, i32* %i, align 4, !dbg !147
  %idxprom = sext i32 %4 to i64, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %5, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !154
  %cmp2 = icmp sge i32 %6, 0, !dbg !156
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !157

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !158
  %cmp3 = icmp slt i32 %7, 10, !dbg !159
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !160

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !161
  %9 = load i32, i32* %data.addr, align 4, !dbg !163
  %idxprom5 = sext i32 %9 to i64, !dbg !161
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !161
  store i32 1, i32* %arrayidx6, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond7, !dbg !167

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !168
  %cmp8 = icmp slt i32 %10, 10, !dbg !170
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !171

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !172
  %12 = load i32, i32* %i, align 4, !dbg !174
  %idxprom10 = sext i32 %12 to i64, !dbg !172
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !172
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !172
  call void @printIntLine(i32 %13), !dbg !175
  br label %for.inc12, !dbg !176

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !177
  %inc13 = add nsw i32 %14, 1, !dbg !177
  store i32 %inc13, i32* %i, align 4, !dbg !177
  br label %for.cond7, !dbg !178, !llvm.loop !179

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !181

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !182
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !184
  %16 = bitcast i32* %15 to i8*, !dbg !184
  call void @free(i8* %16) #5, !dbg !185
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !187 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  store i32 7, i32* %data, align 4, !dbg !191
  %0 = load i32, i32* %data, align 4, !dbg !192
  call void @goodG2BSink(i32 %0), !dbg !193
  ret void, !dbg !194
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !195 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !203
  %0 = bitcast i8* %call to i32*, !dbg !204
  store i32* %0, i32** %buffer, align 8, !dbg !202
  %1 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp = icmp eq i32* %1, null, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !209
  unreachable, !dbg !209

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !214
  %cmp1 = icmp slt i32 %2, 10, !dbg !216
  br i1 %cmp1, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !218
  %4 = load i32, i32* %i, align 4, !dbg !220
  %idxprom = sext i32 %4 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !218
  store i32 0, i32* %arrayidx, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %5, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !227
  %cmp2 = icmp sge i32 %6, 0, !dbg !229
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !230

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !231
  %8 = load i32, i32* %data.addr, align 4, !dbg !233
  %idxprom4 = sext i32 %8 to i64, !dbg !231
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !231
  store i32 1, i32* %arrayidx5, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond6, !dbg !237

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !238
  %cmp7 = icmp slt i32 %9, 10, !dbg !240
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !241

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !242
  %11 = load i32, i32* %i, align 4, !dbg !244
  %idxprom9 = sext i32 %11 to i64, !dbg !242
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !242
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !242
  call void @printIntLine(i32 %12), !dbg !245
  br label %for.inc11, !dbg !246

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !247
  %inc12 = add nsw i32 %13, 1, !dbg !247
  store i32 %inc12, i32* %i, align 4, !dbg !247
  br label %for.cond6, !dbg !248, !llvm.loop !249

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !251

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !252
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !254
  %15 = bitcast i32* %14 to i8*, !dbg !254
  call void @free(i8* %15) #5, !dbg !255
  ret void, !dbg !256
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !6)
!19 = !DILocation(line: 54, column: 9, scope: !14)
!20 = !DILocation(line: 56, column: 10, scope: !14)
!21 = !DILocation(line: 58, column: 10, scope: !14)
!22 = !DILocation(line: 59, column: 13, scope: !14)
!23 = !DILocation(line: 59, column: 5, scope: !14)
!24 = !DILocation(line: 60, column: 1, scope: !14)
!25 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !26, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !6}
!28 = !DILocalVariable(name: "data", arg: 1, scope: !25, file: !15, line: 22, type: !6)
!29 = !DILocation(line: 22, column: 25, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !15, line: 25, type: !6)
!31 = distinct !DILexicalBlock(scope: !25, file: !15, line: 24, column: 5)
!32 = !DILocation(line: 25, column: 13, scope: !31)
!33 = !DILocalVariable(name: "buffer", scope: !31, file: !15, line: 26, type: !5)
!34 = !DILocation(line: 26, column: 15, scope: !31)
!35 = !DILocation(line: 26, column: 31, scope: !31)
!36 = !DILocation(line: 26, column: 24, scope: !31)
!37 = !DILocation(line: 27, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !15, line: 27, column: 13)
!39 = !DILocation(line: 27, column: 20, scope: !38)
!40 = !DILocation(line: 27, column: 13, scope: !31)
!41 = !DILocation(line: 27, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 27, column: 29)
!43 = !DILocation(line: 29, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !31, file: !15, line: 29, column: 9)
!45 = !DILocation(line: 29, column: 14, scope: !44)
!46 = !DILocation(line: 29, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !15, line: 29, column: 9)
!48 = !DILocation(line: 29, column: 23, scope: !47)
!49 = !DILocation(line: 29, column: 9, scope: !44)
!50 = !DILocation(line: 31, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 30, column: 9)
!52 = !DILocation(line: 31, column: 20, scope: !51)
!53 = !DILocation(line: 31, column: 23, scope: !51)
!54 = !DILocation(line: 32, column: 9, scope: !51)
!55 = !DILocation(line: 29, column: 30, scope: !47)
!56 = !DILocation(line: 29, column: 9, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 32, column: 9, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 35, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !31, file: !15, line: 35, column: 13)
!62 = !DILocation(line: 35, column: 18, scope: !61)
!63 = !DILocation(line: 35, column: 13, scope: !31)
!64 = !DILocation(line: 37, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 36, column: 9)
!66 = !DILocation(line: 37, column: 20, scope: !65)
!67 = !DILocation(line: 37, column: 26, scope: !65)
!68 = !DILocation(line: 39, column: 19, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 39, column: 13)
!70 = !DILocation(line: 39, column: 17, scope: !69)
!71 = !DILocation(line: 39, column: 24, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !15, line: 39, column: 13)
!73 = !DILocation(line: 39, column: 26, scope: !72)
!74 = !DILocation(line: 39, column: 13, scope: !69)
!75 = !DILocation(line: 41, column: 30, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 40, column: 13)
!77 = !DILocation(line: 41, column: 37, scope: !76)
!78 = !DILocation(line: 41, column: 17, scope: !76)
!79 = !DILocation(line: 42, column: 13, scope: !76)
!80 = !DILocation(line: 39, column: 33, scope: !72)
!81 = !DILocation(line: 39, column: 13, scope: !72)
!82 = distinct !{!82, !74, !83, !59}
!83 = !DILocation(line: 42, column: 13, scope: !69)
!84 = !DILocation(line: 43, column: 9, scope: !65)
!85 = !DILocation(line: 46, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !61, file: !15, line: 45, column: 9)
!87 = !DILocation(line: 48, column: 14, scope: !31)
!88 = !DILocation(line: 48, column: 9, scope: !31)
!89 = !DILocation(line: 50, column: 1, scope: !25)
!90 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_good", scope: !15, file: !15, line: 148, type: !16, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 150, column: 5, scope: !90)
!92 = !DILocation(line: 151, column: 5, scope: !90)
!93 = !DILocation(line: 152, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 163, type: !95, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!6, !6, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !15, line: 163, type: !6)
!101 = !DILocation(line: 163, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !15, line: 163, type: !97)
!103 = !DILocation(line: 163, column: 27, scope: !94)
!104 = !DILocation(line: 166, column: 22, scope: !94)
!105 = !DILocation(line: 166, column: 12, scope: !94)
!106 = !DILocation(line: 166, column: 5, scope: !94)
!107 = !DILocation(line: 168, column: 5, scope: !94)
!108 = !DILocation(line: 169, column: 5, scope: !94)
!109 = !DILocation(line: 170, column: 5, scope: !94)
!110 = !DILocation(line: 173, column: 5, scope: !94)
!111 = !DILocation(line: 174, column: 5, scope: !94)
!112 = !DILocation(line: 175, column: 5, scope: !94)
!113 = !DILocation(line: 177, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 140, type: !6)
!116 = !DILocation(line: 140, column: 9, scope: !114)
!117 = !DILocation(line: 142, column: 10, scope: !114)
!118 = !DILocation(line: 144, column: 10, scope: !114)
!119 = !DILocation(line: 145, column: 17, scope: !114)
!120 = !DILocation(line: 145, column: 5, scope: !114)
!121 = !DILocation(line: 146, column: 1, scope: !114)
!122 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 109, type: !26, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", arg: 1, scope: !122, file: !15, line: 109, type: !6)
!124 = !DILocation(line: 109, column: 29, scope: !122)
!125 = !DILocalVariable(name: "i", scope: !126, file: !15, line: 112, type: !6)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 111, column: 5)
!127 = !DILocation(line: 112, column: 13, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !126, file: !15, line: 113, type: !5)
!129 = !DILocation(line: 113, column: 15, scope: !126)
!130 = !DILocation(line: 113, column: 31, scope: !126)
!131 = !DILocation(line: 113, column: 24, scope: !126)
!132 = !DILocation(line: 114, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !15, line: 114, column: 13)
!134 = !DILocation(line: 114, column: 20, scope: !133)
!135 = !DILocation(line: 114, column: 13, scope: !126)
!136 = !DILocation(line: 114, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 114, column: 29)
!138 = !DILocation(line: 116, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !15, line: 116, column: 9)
!140 = !DILocation(line: 116, column: 14, scope: !139)
!141 = !DILocation(line: 116, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 116, column: 9)
!143 = !DILocation(line: 116, column: 23, scope: !142)
!144 = !DILocation(line: 116, column: 9, scope: !139)
!145 = !DILocation(line: 118, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 117, column: 9)
!147 = !DILocation(line: 118, column: 20, scope: !146)
!148 = !DILocation(line: 118, column: 23, scope: !146)
!149 = !DILocation(line: 119, column: 9, scope: !146)
!150 = !DILocation(line: 116, column: 30, scope: !142)
!151 = !DILocation(line: 116, column: 9, scope: !142)
!152 = distinct !{!152, !144, !153, !59}
!153 = !DILocation(line: 119, column: 9, scope: !139)
!154 = !DILocation(line: 121, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !126, file: !15, line: 121, column: 13)
!156 = !DILocation(line: 121, column: 18, scope: !155)
!157 = !DILocation(line: 121, column: 23, scope: !155)
!158 = !DILocation(line: 121, column: 26, scope: !155)
!159 = !DILocation(line: 121, column: 31, scope: !155)
!160 = !DILocation(line: 121, column: 13, scope: !126)
!161 = !DILocation(line: 123, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !15, line: 122, column: 9)
!163 = !DILocation(line: 123, column: 20, scope: !162)
!164 = !DILocation(line: 123, column: 26, scope: !162)
!165 = !DILocation(line: 125, column: 19, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 125, column: 13)
!167 = !DILocation(line: 125, column: 17, scope: !166)
!168 = !DILocation(line: 125, column: 24, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 125, column: 13)
!170 = !DILocation(line: 125, column: 26, scope: !169)
!171 = !DILocation(line: 125, column: 13, scope: !166)
!172 = !DILocation(line: 127, column: 30, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 126, column: 13)
!174 = !DILocation(line: 127, column: 37, scope: !173)
!175 = !DILocation(line: 127, column: 17, scope: !173)
!176 = !DILocation(line: 128, column: 13, scope: !173)
!177 = !DILocation(line: 125, column: 33, scope: !169)
!178 = !DILocation(line: 125, column: 13, scope: !169)
!179 = distinct !{!179, !171, !180, !59}
!180 = !DILocation(line: 128, column: 13, scope: !166)
!181 = !DILocation(line: 129, column: 9, scope: !162)
!182 = !DILocation(line: 132, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !15, line: 131, column: 9)
!184 = !DILocation(line: 134, column: 14, scope: !126)
!185 = !DILocation(line: 134, column: 9, scope: !126)
!186 = !DILocation(line: 136, column: 1, scope: !122)
!187 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!188 = !DILocalVariable(name: "data", scope: !187, file: !15, line: 99, type: !6)
!189 = !DILocation(line: 99, column: 9, scope: !187)
!190 = !DILocation(line: 101, column: 10, scope: !187)
!191 = !DILocation(line: 104, column: 10, scope: !187)
!192 = !DILocation(line: 105, column: 17, scope: !187)
!193 = !DILocation(line: 105, column: 5, scope: !187)
!194 = !DILocation(line: 106, column: 1, scope: !187)
!195 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 67, type: !26, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!196 = !DILocalVariable(name: "data", arg: 1, scope: !195, file: !15, line: 67, type: !6)
!197 = !DILocation(line: 67, column: 29, scope: !195)
!198 = !DILocalVariable(name: "i", scope: !199, file: !15, line: 70, type: !6)
!199 = distinct !DILexicalBlock(scope: !195, file: !15, line: 69, column: 5)
!200 = !DILocation(line: 70, column: 13, scope: !199)
!201 = !DILocalVariable(name: "buffer", scope: !199, file: !15, line: 71, type: !5)
!202 = !DILocation(line: 71, column: 15, scope: !199)
!203 = !DILocation(line: 71, column: 31, scope: !199)
!204 = !DILocation(line: 71, column: 24, scope: !199)
!205 = !DILocation(line: 72, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !15, line: 72, column: 13)
!207 = !DILocation(line: 72, column: 20, scope: !206)
!208 = !DILocation(line: 72, column: 13, scope: !199)
!209 = !DILocation(line: 72, column: 30, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 72, column: 29)
!211 = !DILocation(line: 74, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !199, file: !15, line: 74, column: 9)
!213 = !DILocation(line: 74, column: 14, scope: !212)
!214 = !DILocation(line: 74, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !15, line: 74, column: 9)
!216 = !DILocation(line: 74, column: 23, scope: !215)
!217 = !DILocation(line: 74, column: 9, scope: !212)
!218 = !DILocation(line: 76, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 75, column: 9)
!220 = !DILocation(line: 76, column: 20, scope: !219)
!221 = !DILocation(line: 76, column: 23, scope: !219)
!222 = !DILocation(line: 77, column: 9, scope: !219)
!223 = !DILocation(line: 74, column: 30, scope: !215)
!224 = !DILocation(line: 74, column: 9, scope: !215)
!225 = distinct !{!225, !217, !226, !59}
!226 = !DILocation(line: 77, column: 9, scope: !212)
!227 = !DILocation(line: 80, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !199, file: !15, line: 80, column: 13)
!229 = !DILocation(line: 80, column: 18, scope: !228)
!230 = !DILocation(line: 80, column: 13, scope: !199)
!231 = !DILocation(line: 82, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 81, column: 9)
!233 = !DILocation(line: 82, column: 20, scope: !232)
!234 = !DILocation(line: 82, column: 26, scope: !232)
!235 = !DILocation(line: 84, column: 19, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !15, line: 84, column: 13)
!237 = !DILocation(line: 84, column: 17, scope: !236)
!238 = !DILocation(line: 84, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !15, line: 84, column: 13)
!240 = !DILocation(line: 84, column: 26, scope: !239)
!241 = !DILocation(line: 84, column: 13, scope: !236)
!242 = !DILocation(line: 86, column: 30, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 85, column: 13)
!244 = !DILocation(line: 86, column: 37, scope: !243)
!245 = !DILocation(line: 86, column: 17, scope: !243)
!246 = !DILocation(line: 87, column: 13, scope: !243)
!247 = !DILocation(line: 84, column: 33, scope: !239)
!248 = !DILocation(line: 84, column: 13, scope: !239)
!249 = distinct !{!249, !241, !250, !59}
!250 = !DILocation(line: 87, column: 13, scope: !236)
!251 = !DILocation(line: 88, column: 9, scope: !232)
!252 = !DILocation(line: 91, column: 13, scope: !253)
!253 = distinct !DILexicalBlock(scope: !228, file: !15, line: 90, column: 9)
!254 = !DILocation(line: 93, column: 14, scope: !199)
!255 = !DILocation(line: 93, column: 9, scope: !199)
!256 = !DILocation(line: 95, column: 1, scope: !195)
