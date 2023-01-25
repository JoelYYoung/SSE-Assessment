; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  store i32 10, i32* %data, align 4, !dbg !24
  br label %sink, !dbg !25

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !31, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %buffer, align 8, !dbg !32
  %1 = load i32*, i32** %buffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !44
  %cmp1 = icmp slt i32 %2, 10, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !48
  %4 = load i32, i32* %i, align 4, !dbg !50
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %5, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !58
  %cmp2 = icmp sge i32 %6, 0, !dbg !60
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !61

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !62
  %8 = load i32, i32* %data, align 4, !dbg !64
  %idxprom4 = sext i32 %8 to i64, !dbg !62
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !62
  store i32 1, i32* %arrayidx5, align 4, !dbg !65
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond6, !dbg !68

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !69
  %cmp7 = icmp slt i32 %9, 10, !dbg !71
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !72

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !73
  %11 = load i32, i32* %i, align 4, !dbg !75
  %idxprom9 = sext i32 %11 to i64, !dbg !73
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !73
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !73
  call void @printIntLine(i32 %12), !dbg !76
  br label %for.inc11, !dbg !77

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !78
  %inc12 = add nsw i32 %13, 1, !dbg !78
  store i32 %inc12, i32* %i, align 4, !dbg !78
  br label %for.cond6, !dbg !79, !llvm.loop !80

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !82

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !85
  %15 = bitcast i32* %14 to i8*, !dbg !85
  call void @free(i8* %15) #5, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18_good() #0 !dbg !88 {
entry:
  call void @goodB2G(), !dbg !89
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !112 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %data, align 4, !dbg !115
  br label %source, !dbg !116

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !117), !dbg !118
  store i32 10, i32* %data, align 4, !dbg !119
  br label %sink, !dbg !120

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !121), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !128
  %0 = bitcast i8* %call to i32*, !dbg !129
  store i32* %0, i32** %buffer, align 8, !dbg !127
  %1 = load i32*, i32** %buffer, align 8, !dbg !130
  %cmp = icmp eq i32* %1, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !139
  %cmp1 = icmp slt i32 %2, 10, !dbg !141
  br i1 %cmp1, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !143
  %4 = load i32, i32* %i, align 4, !dbg !145
  %idxprom = sext i32 %4 to i64, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !148
  %inc = add nsw i32 %5, 1, !dbg !148
  store i32 %inc, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !152
  %cmp2 = icmp sge i32 %6, 0, !dbg !154
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !155

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !156
  %cmp3 = icmp slt i32 %7, 10, !dbg !157
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !158

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !159
  %9 = load i32, i32* %data, align 4, !dbg !161
  %idxprom5 = sext i32 %9 to i64, !dbg !159
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !159
  store i32 1, i32* %arrayidx6, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond7, !dbg !165

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !166
  %cmp8 = icmp slt i32 %10, 10, !dbg !168
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !169

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !170
  %12 = load i32, i32* %i, align 4, !dbg !172
  %idxprom10 = sext i32 %12 to i64, !dbg !170
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !170
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !170
  call void @printIntLine(i32 %13), !dbg !173
  br label %for.inc12, !dbg !174

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !175
  %inc13 = add nsw i32 %14, 1, !dbg !175
  store i32 %inc13, i32* %i, align 4, !dbg !175
  br label %for.cond7, !dbg !176, !llvm.loop !177

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !179

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !180
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !182
  %16 = bitcast i32* %15 to i8*, !dbg !182
  call void @free(i8* %16) #5, !dbg !183
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  br label %source, !dbg !189

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !190), !dbg !191
  store i32 7, i32* %data, align 4, !dbg !192
  br label %sink, !dbg !193

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !194), !dbg !195
  call void @llvm.dbg.declare(metadata i32* %i, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !199, metadata !DIExpression()), !dbg !200
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !201
  %0 = bitcast i8* %call to i32*, !dbg !202
  store i32* %0, i32** %buffer, align 8, !dbg !200
  %1 = load i32*, i32** %buffer, align 8, !dbg !203
  %cmp = icmp eq i32* %1, null, !dbg !205
  br i1 %cmp, label %if.then, label %if.end, !dbg !206

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #6, !dbg !207
  unreachable, !dbg !207

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !212
  %cmp1 = icmp slt i32 %2, 10, !dbg !214
  br i1 %cmp1, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !216
  %4 = load i32, i32* %i, align 4, !dbg !218
  %idxprom = sext i32 %4 to i64, !dbg !216
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !216
  store i32 0, i32* %arrayidx, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %5, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !225
  %cmp2 = icmp sge i32 %6, 0, !dbg !227
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !228

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !229
  %8 = load i32, i32* %data, align 4, !dbg !231
  %idxprom4 = sext i32 %8 to i64, !dbg !229
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !229
  store i32 1, i32* %arrayidx5, align 4, !dbg !232
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond6, !dbg !235

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !236
  %cmp7 = icmp slt i32 %9, 10, !dbg !238
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !239

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !240
  %11 = load i32, i32* %i, align 4, !dbg !242
  %idxprom9 = sext i32 %11 to i64, !dbg !240
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !240
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !240
  call void @printIntLine(i32 %12), !dbg !243
  br label %for.inc11, !dbg !244

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !245
  %inc12 = add nsw i32 %13, 1, !dbg !245
  store i32 %inc12, i32* %i, align 4, !dbg !245
  br label %for.cond6, !dbg !246, !llvm.loop !247

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !249

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !250
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !252
  %15 = bitcast i32* %14 to i8*, !dbg !252
  call void @free(i8* %15) #5, !dbg !253
  ret void, !dbg !254
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocation(line: 30, column: 10, scope: !14)
!25 = !DILocation(line: 31, column: 5, scope: !14)
!26 = !DILabel(scope: !14, name: "sink", file: !15, line: 32)
!27 = !DILocation(line: 32, column: 1, scope: !14)
!28 = !DILocalVariable(name: "i", scope: !29, file: !15, line: 34, type: !5)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!30 = !DILocation(line: 34, column: 13, scope: !29)
!31 = !DILocalVariable(name: "buffer", scope: !29, file: !15, line: 35, type: !4)
!32 = !DILocation(line: 35, column: 15, scope: !29)
!33 = !DILocation(line: 35, column: 31, scope: !29)
!34 = !DILocation(line: 35, column: 24, scope: !29)
!35 = !DILocation(line: 36, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 13)
!37 = !DILocation(line: 36, column: 20, scope: !36)
!38 = !DILocation(line: 36, column: 13, scope: !29)
!39 = !DILocation(line: 36, column: 30, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 36, column: 29)
!41 = !DILocation(line: 38, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !29, file: !15, line: 38, column: 9)
!43 = !DILocation(line: 38, column: 14, scope: !42)
!44 = !DILocation(line: 38, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !15, line: 38, column: 9)
!46 = !DILocation(line: 38, column: 23, scope: !45)
!47 = !DILocation(line: 38, column: 9, scope: !42)
!48 = !DILocation(line: 40, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 39, column: 9)
!50 = !DILocation(line: 40, column: 20, scope: !49)
!51 = !DILocation(line: 40, column: 23, scope: !49)
!52 = !DILocation(line: 41, column: 9, scope: !49)
!53 = !DILocation(line: 38, column: 30, scope: !45)
!54 = !DILocation(line: 38, column: 9, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 41, column: 9, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 44, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !29, file: !15, line: 44, column: 13)
!60 = !DILocation(line: 44, column: 18, scope: !59)
!61 = !DILocation(line: 44, column: 13, scope: !29)
!62 = !DILocation(line: 46, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 45, column: 9)
!64 = !DILocation(line: 46, column: 20, scope: !63)
!65 = !DILocation(line: 46, column: 26, scope: !63)
!66 = !DILocation(line: 48, column: 19, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 48, column: 13)
!68 = !DILocation(line: 48, column: 17, scope: !67)
!69 = !DILocation(line: 48, column: 24, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 48, column: 13)
!71 = !DILocation(line: 48, column: 26, scope: !70)
!72 = !DILocation(line: 48, column: 13, scope: !67)
!73 = !DILocation(line: 50, column: 30, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 49, column: 13)
!75 = !DILocation(line: 50, column: 37, scope: !74)
!76 = !DILocation(line: 50, column: 17, scope: !74)
!77 = !DILocation(line: 51, column: 13, scope: !74)
!78 = !DILocation(line: 48, column: 33, scope: !70)
!79 = !DILocation(line: 48, column: 13, scope: !70)
!80 = distinct !{!80, !72, !81, !57}
!81 = !DILocation(line: 51, column: 13, scope: !67)
!82 = !DILocation(line: 52, column: 9, scope: !63)
!83 = !DILocation(line: 55, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !59, file: !15, line: 54, column: 9)
!85 = !DILocation(line: 57, column: 14, scope: !29)
!86 = !DILocation(line: 57, column: 9, scope: !29)
!87 = !DILocation(line: 59, column: 1, scope: !14)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_18_good", scope: !15, file: !15, line: 145, type: !16, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 147, column: 5, scope: !88)
!90 = !DILocation(line: 148, column: 5, scope: !88)
!91 = !DILocation(line: 149, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 160, type: !93, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!5, !5, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 160, type: !5)
!99 = !DILocation(line: 160, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 160, type: !95)
!101 = !DILocation(line: 160, column: 27, scope: !92)
!102 = !DILocation(line: 163, column: 22, scope: !92)
!103 = !DILocation(line: 163, column: 12, scope: !92)
!104 = !DILocation(line: 163, column: 5, scope: !92)
!105 = !DILocation(line: 165, column: 5, scope: !92)
!106 = !DILocation(line: 166, column: 5, scope: !92)
!107 = !DILocation(line: 167, column: 5, scope: !92)
!108 = !DILocation(line: 170, column: 5, scope: !92)
!109 = !DILocation(line: 171, column: 5, scope: !92)
!110 = !DILocation(line: 172, column: 5, scope: !92)
!111 = !DILocation(line: 174, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 68, type: !5)
!114 = !DILocation(line: 68, column: 9, scope: !112)
!115 = !DILocation(line: 70, column: 10, scope: !112)
!116 = !DILocation(line: 71, column: 5, scope: !112)
!117 = !DILabel(scope: !112, name: "source", file: !15, line: 72)
!118 = !DILocation(line: 72, column: 1, scope: !112)
!119 = !DILocation(line: 74, column: 10, scope: !112)
!120 = !DILocation(line: 75, column: 5, scope: !112)
!121 = !DILabel(scope: !112, name: "sink", file: !15, line: 76)
!122 = !DILocation(line: 76, column: 1, scope: !112)
!123 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 78, type: !5)
!124 = distinct !DILexicalBlock(scope: !112, file: !15, line: 77, column: 5)
!125 = !DILocation(line: 78, column: 13, scope: !124)
!126 = !DILocalVariable(name: "buffer", scope: !124, file: !15, line: 79, type: !4)
!127 = !DILocation(line: 79, column: 15, scope: !124)
!128 = !DILocation(line: 79, column: 31, scope: !124)
!129 = !DILocation(line: 79, column: 24, scope: !124)
!130 = !DILocation(line: 80, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !15, line: 80, column: 13)
!132 = !DILocation(line: 80, column: 20, scope: !131)
!133 = !DILocation(line: 80, column: 13, scope: !124)
!134 = !DILocation(line: 80, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 80, column: 29)
!136 = !DILocation(line: 82, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !15, line: 82, column: 9)
!138 = !DILocation(line: 82, column: 14, scope: !137)
!139 = !DILocation(line: 82, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 82, column: 9)
!141 = !DILocation(line: 82, column: 23, scope: !140)
!142 = !DILocation(line: 82, column: 9, scope: !137)
!143 = !DILocation(line: 84, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 83, column: 9)
!145 = !DILocation(line: 84, column: 20, scope: !144)
!146 = !DILocation(line: 84, column: 23, scope: !144)
!147 = !DILocation(line: 85, column: 9, scope: !144)
!148 = !DILocation(line: 82, column: 30, scope: !140)
!149 = !DILocation(line: 82, column: 9, scope: !140)
!150 = distinct !{!150, !142, !151, !57}
!151 = !DILocation(line: 85, column: 9, scope: !137)
!152 = !DILocation(line: 87, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !124, file: !15, line: 87, column: 13)
!154 = !DILocation(line: 87, column: 18, scope: !153)
!155 = !DILocation(line: 87, column: 23, scope: !153)
!156 = !DILocation(line: 87, column: 26, scope: !153)
!157 = !DILocation(line: 87, column: 31, scope: !153)
!158 = !DILocation(line: 87, column: 13, scope: !124)
!159 = !DILocation(line: 89, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !15, line: 88, column: 9)
!161 = !DILocation(line: 89, column: 20, scope: !160)
!162 = !DILocation(line: 89, column: 26, scope: !160)
!163 = !DILocation(line: 91, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 91, column: 13)
!165 = !DILocation(line: 91, column: 17, scope: !164)
!166 = !DILocation(line: 91, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 91, column: 13)
!168 = !DILocation(line: 91, column: 26, scope: !167)
!169 = !DILocation(line: 91, column: 13, scope: !164)
!170 = !DILocation(line: 93, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 92, column: 13)
!172 = !DILocation(line: 93, column: 37, scope: !171)
!173 = !DILocation(line: 93, column: 17, scope: !171)
!174 = !DILocation(line: 94, column: 13, scope: !171)
!175 = !DILocation(line: 91, column: 33, scope: !167)
!176 = !DILocation(line: 91, column: 13, scope: !167)
!177 = distinct !{!177, !169, !178, !57}
!178 = !DILocation(line: 94, column: 13, scope: !164)
!179 = !DILocation(line: 95, column: 9, scope: !160)
!180 = !DILocation(line: 98, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !153, file: !15, line: 97, column: 9)
!182 = !DILocation(line: 100, column: 14, scope: !124)
!183 = !DILocation(line: 100, column: 9, scope: !124)
!184 = !DILocation(line: 102, column: 1, scope: !112)
!185 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 105, type: !16, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!186 = !DILocalVariable(name: "data", scope: !185, file: !15, line: 107, type: !5)
!187 = !DILocation(line: 107, column: 9, scope: !185)
!188 = !DILocation(line: 109, column: 10, scope: !185)
!189 = !DILocation(line: 110, column: 5, scope: !185)
!190 = !DILabel(scope: !185, name: "source", file: !15, line: 111)
!191 = !DILocation(line: 111, column: 1, scope: !185)
!192 = !DILocation(line: 114, column: 10, scope: !185)
!193 = !DILocation(line: 115, column: 5, scope: !185)
!194 = !DILabel(scope: !185, name: "sink", file: !15, line: 116)
!195 = !DILocation(line: 116, column: 1, scope: !185)
!196 = !DILocalVariable(name: "i", scope: !197, file: !15, line: 118, type: !5)
!197 = distinct !DILexicalBlock(scope: !185, file: !15, line: 117, column: 5)
!198 = !DILocation(line: 118, column: 13, scope: !197)
!199 = !DILocalVariable(name: "buffer", scope: !197, file: !15, line: 119, type: !4)
!200 = !DILocation(line: 119, column: 15, scope: !197)
!201 = !DILocation(line: 119, column: 31, scope: !197)
!202 = !DILocation(line: 119, column: 24, scope: !197)
!203 = !DILocation(line: 120, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !197, file: !15, line: 120, column: 13)
!205 = !DILocation(line: 120, column: 20, scope: !204)
!206 = !DILocation(line: 120, column: 13, scope: !197)
!207 = !DILocation(line: 120, column: 30, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 120, column: 29)
!209 = !DILocation(line: 122, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !15, line: 122, column: 9)
!211 = !DILocation(line: 122, column: 14, scope: !210)
!212 = !DILocation(line: 122, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 122, column: 9)
!214 = !DILocation(line: 122, column: 23, scope: !213)
!215 = !DILocation(line: 122, column: 9, scope: !210)
!216 = !DILocation(line: 124, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !15, line: 123, column: 9)
!218 = !DILocation(line: 124, column: 20, scope: !217)
!219 = !DILocation(line: 124, column: 23, scope: !217)
!220 = !DILocation(line: 125, column: 9, scope: !217)
!221 = !DILocation(line: 122, column: 30, scope: !213)
!222 = !DILocation(line: 122, column: 9, scope: !213)
!223 = distinct !{!223, !215, !224, !57}
!224 = !DILocation(line: 125, column: 9, scope: !210)
!225 = !DILocation(line: 128, column: 13, scope: !226)
!226 = distinct !DILexicalBlock(scope: !197, file: !15, line: 128, column: 13)
!227 = !DILocation(line: 128, column: 18, scope: !226)
!228 = !DILocation(line: 128, column: 13, scope: !197)
!229 = !DILocation(line: 130, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !15, line: 129, column: 9)
!231 = !DILocation(line: 130, column: 20, scope: !230)
!232 = !DILocation(line: 130, column: 26, scope: !230)
!233 = !DILocation(line: 132, column: 19, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !15, line: 132, column: 13)
!235 = !DILocation(line: 132, column: 17, scope: !234)
!236 = !DILocation(line: 132, column: 24, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !15, line: 132, column: 13)
!238 = !DILocation(line: 132, column: 26, scope: !237)
!239 = !DILocation(line: 132, column: 13, scope: !234)
!240 = !DILocation(line: 134, column: 30, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 133, column: 13)
!242 = !DILocation(line: 134, column: 37, scope: !241)
!243 = !DILocation(line: 134, column: 17, scope: !241)
!244 = !DILocation(line: 135, column: 13, scope: !241)
!245 = !DILocation(line: 132, column: 33, scope: !237)
!246 = !DILocation(line: 132, column: 13, scope: !237)
!247 = distinct !{!247, !239, !248, !57}
!248 = !DILocation(line: 135, column: 13, scope: !234)
!249 = !DILocation(line: 136, column: 9, scope: !230)
!250 = !DILocation(line: 139, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !226, file: !15, line: 138, column: 9)
!252 = !DILocation(line: 141, column: 14, scope: !197)
!253 = !DILocation(line: 141, column: 9, scope: !197)
!254 = !DILocation(line: 143, column: 1, scope: !185)
