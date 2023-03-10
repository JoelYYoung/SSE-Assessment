; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_badGlobal, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_badSource(i8* %0), !dbg !31
  store i8* %call1, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %2 = load i8*, i8** %data, align 8, !dbg !46
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !47
  store i64 %call2, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !52
  %4 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %3, %4, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !57
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !57
  %7 = load i8, i8* %arrayidx, align 1, !dbg !57
  %8 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !61
  store i8 %7, i8* %arrayidx3, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %9, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !69
  store i8 0, i8* %arrayidx4, align 1, !dbg !70
  %10 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %10), !dbg !72
  %11 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* %11) #6, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B1Global, align 4, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B1Source(i8* %0), !dbg !105
  store i8* %call1, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !115
  store i64 %call2, i64* %dataLen, align 8, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !120
  %4 = load i64, i64* %dataLen, align 8, !dbg !122
  %cmp = icmp ult i64 %3, %4, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !125
  %6 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !125
  %7 = load i8, i8* %arrayidx, align 1, !dbg !125
  %8 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !129
  store i8 %7, i8* %arrayidx3, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %9, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !136
  store i8 0, i8* %arrayidx4, align 1, !dbg !137
  %10 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %10), !dbg !139
  %11 = load i8*, i8** %data, align 8, !dbg !140
  call void @free(i8* %11) #6, !dbg !141
  ret void, !dbg !142
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B1Source(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !144, metadata !DIExpression()), !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !146
  store i8* %call, i8** %data, align 8, !dbg !147
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B2Global, align 4, !dbg !148
  %0 = load i8*, i8** %data, align 8, !dbg !149
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B2Source(i8* %0), !dbg !150
  store i8* %call1, i8** %data, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !152, metadata !DIExpression()), !dbg !154
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !157, metadata !DIExpression()), !dbg !158
  %2 = load i8*, i8** %data, align 8, !dbg !159
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !160
  store i64 %call2, i64* %dataLen, align 8, !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !165
  %4 = load i64, i64* %dataLen, align 8, !dbg !167
  %cmp = icmp ult i64 %3, %4, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !170
  %6 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !170
  %7 = load i8, i8* %arrayidx, align 1, !dbg !170
  %8 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !174
  store i8 %7, i8* %arrayidx3, align 1, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %9, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !181
  store i8 0, i8* %arrayidx4, align 1, !dbg !182
  %10 = load i8*, i8** %data, align 8, !dbg !183
  call void @printLine(i8* %10), !dbg !184
  %11 = load i8*, i8** %data, align 8, !dbg !185
  call void @free(i8* %11) #6, !dbg !186
  ret void, !dbg !187
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B2Source(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_badGlobal", scope: !2, file: !12, line: 24, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B1Global", scope: !2, file: !12, line: 54, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_goodG2B2Global", scope: !2, file: !12, line: 55, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_bad", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 30, type: !6)
!26 = !DILocation(line: 30, column: 12, scope: !22)
!27 = !DILocation(line: 31, column: 20, scope: !22)
!28 = !DILocation(line: 31, column: 10, scope: !22)
!29 = !DILocation(line: 32, column: 72, scope: !22)
!30 = !DILocation(line: 33, column: 79, scope: !22)
!31 = !DILocation(line: 33, column: 12, scope: !22)
!32 = !DILocation(line: 33, column: 10, scope: !22)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !22, file: !12, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 36, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !34)
!44 = !DILocalVariable(name: "dataLen", scope: !34, file: !12, line: 36, type: !40)
!45 = !DILocation(line: 36, column: 19, scope: !34)
!46 = !DILocation(line: 37, column: 26, scope: !34)
!47 = !DILocation(line: 37, column: 19, scope: !34)
!48 = !DILocation(line: 37, column: 17, scope: !34)
!49 = !DILocation(line: 39, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !34, file: !12, line: 39, column: 9)
!51 = !DILocation(line: 39, column: 14, scope: !50)
!52 = !DILocation(line: 39, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 39, column: 9)
!54 = !DILocation(line: 39, column: 25, scope: !53)
!55 = !DILocation(line: 39, column: 23, scope: !53)
!56 = !DILocation(line: 39, column: 9, scope: !50)
!57 = !DILocation(line: 41, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !12, line: 40, column: 9)
!59 = !DILocation(line: 41, column: 28, scope: !58)
!60 = !DILocation(line: 41, column: 18, scope: !58)
!61 = !DILocation(line: 41, column: 13, scope: !58)
!62 = !DILocation(line: 41, column: 21, scope: !58)
!63 = !DILocation(line: 42, column: 9, scope: !58)
!64 = !DILocation(line: 39, column: 35, scope: !53)
!65 = !DILocation(line: 39, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 42, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 43, column: 9, scope: !34)
!70 = !DILocation(line: 43, column: 20, scope: !34)
!71 = !DILocation(line: 44, column: 19, scope: !34)
!72 = !DILocation(line: 44, column: 9, scope: !34)
!73 = !DILocation(line: 45, column: 14, scope: !34)
!74 = !DILocation(line: 45, column: 9, scope: !34)
!75 = !DILocation(line: 47, column: 1, scope: !22)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_22_good", scope: !12, file: !12, line: 105, type: !23, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 107, column: 5, scope: !76)
!78 = !DILocation(line: 108, column: 5, scope: !76)
!79 = !DILocation(line: 109, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !81, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!13, !13, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 121, type: !13)
!85 = !DILocation(line: 121, column: 14, scope: !80)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 121, type: !83)
!87 = !DILocation(line: 121, column: 27, scope: !80)
!88 = !DILocation(line: 124, column: 22, scope: !80)
!89 = !DILocation(line: 124, column: 12, scope: !80)
!90 = !DILocation(line: 124, column: 5, scope: !80)
!91 = !DILocation(line: 126, column: 5, scope: !80)
!92 = !DILocation(line: 127, column: 5, scope: !80)
!93 = !DILocation(line: 128, column: 5, scope: !80)
!94 = !DILocation(line: 131, column: 5, scope: !80)
!95 = !DILocation(line: 132, column: 5, scope: !80)
!96 = !DILocation(line: 133, column: 5, scope: !80)
!97 = !DILocation(line: 135, column: 5, scope: !80)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 62, type: !6)
!100 = !DILocation(line: 62, column: 12, scope: !98)
!101 = !DILocation(line: 63, column: 20, scope: !98)
!102 = !DILocation(line: 63, column: 10, scope: !98)
!103 = !DILocation(line: 64, column: 77, scope: !98)
!104 = !DILocation(line: 65, column: 84, scope: !98)
!105 = !DILocation(line: 65, column: 12, scope: !98)
!106 = !DILocation(line: 65, column: 10, scope: !98)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 67, type: !35)
!108 = distinct !DILexicalBlock(scope: !98, file: !12, line: 66, column: 5)
!109 = !DILocation(line: 67, column: 14, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !108, file: !12, line: 68, type: !40)
!111 = !DILocation(line: 68, column: 16, scope: !108)
!112 = !DILocalVariable(name: "dataLen", scope: !108, file: !12, line: 68, type: !40)
!113 = !DILocation(line: 68, column: 19, scope: !108)
!114 = !DILocation(line: 69, column: 26, scope: !108)
!115 = !DILocation(line: 69, column: 19, scope: !108)
!116 = !DILocation(line: 69, column: 17, scope: !108)
!117 = !DILocation(line: 71, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !12, line: 71, column: 9)
!119 = !DILocation(line: 71, column: 14, scope: !118)
!120 = !DILocation(line: 71, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 71, column: 9)
!122 = !DILocation(line: 71, column: 25, scope: !121)
!123 = !DILocation(line: 71, column: 23, scope: !121)
!124 = !DILocation(line: 71, column: 9, scope: !118)
!125 = !DILocation(line: 73, column: 23, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !12, line: 72, column: 9)
!127 = !DILocation(line: 73, column: 28, scope: !126)
!128 = !DILocation(line: 73, column: 18, scope: !126)
!129 = !DILocation(line: 73, column: 13, scope: !126)
!130 = !DILocation(line: 73, column: 21, scope: !126)
!131 = !DILocation(line: 74, column: 9, scope: !126)
!132 = !DILocation(line: 71, column: 35, scope: !121)
!133 = !DILocation(line: 71, column: 9, scope: !121)
!134 = distinct !{!134, !124, !135, !68}
!135 = !DILocation(line: 74, column: 9, scope: !118)
!136 = !DILocation(line: 75, column: 9, scope: !108)
!137 = !DILocation(line: 75, column: 20, scope: !108)
!138 = !DILocation(line: 76, column: 19, scope: !108)
!139 = !DILocation(line: 76, column: 9, scope: !108)
!140 = !DILocation(line: 77, column: 14, scope: !108)
!141 = !DILocation(line: 77, column: 9, scope: !108)
!142 = !DILocation(line: 79, column: 1, scope: !98)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !23, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 86, type: !6)
!145 = !DILocation(line: 86, column: 12, scope: !143)
!146 = !DILocation(line: 87, column: 20, scope: !143)
!147 = !DILocation(line: 87, column: 10, scope: !143)
!148 = !DILocation(line: 88, column: 77, scope: !143)
!149 = !DILocation(line: 89, column: 84, scope: !143)
!150 = !DILocation(line: 89, column: 12, scope: !143)
!151 = !DILocation(line: 89, column: 10, scope: !143)
!152 = !DILocalVariable(name: "dest", scope: !153, file: !12, line: 91, type: !35)
!153 = distinct !DILexicalBlock(scope: !143, file: !12, line: 90, column: 5)
!154 = !DILocation(line: 91, column: 14, scope: !153)
!155 = !DILocalVariable(name: "i", scope: !153, file: !12, line: 92, type: !40)
!156 = !DILocation(line: 92, column: 16, scope: !153)
!157 = !DILocalVariable(name: "dataLen", scope: !153, file: !12, line: 92, type: !40)
!158 = !DILocation(line: 92, column: 19, scope: !153)
!159 = !DILocation(line: 93, column: 26, scope: !153)
!160 = !DILocation(line: 93, column: 19, scope: !153)
!161 = !DILocation(line: 93, column: 17, scope: !153)
!162 = !DILocation(line: 95, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !153, file: !12, line: 95, column: 9)
!164 = !DILocation(line: 95, column: 14, scope: !163)
!165 = !DILocation(line: 95, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 95, column: 9)
!167 = !DILocation(line: 95, column: 25, scope: !166)
!168 = !DILocation(line: 95, column: 23, scope: !166)
!169 = !DILocation(line: 95, column: 9, scope: !163)
!170 = !DILocation(line: 97, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !12, line: 96, column: 9)
!172 = !DILocation(line: 97, column: 28, scope: !171)
!173 = !DILocation(line: 97, column: 18, scope: !171)
!174 = !DILocation(line: 97, column: 13, scope: !171)
!175 = !DILocation(line: 97, column: 21, scope: !171)
!176 = !DILocation(line: 98, column: 9, scope: !171)
!177 = !DILocation(line: 95, column: 35, scope: !166)
!178 = !DILocation(line: 95, column: 9, scope: !166)
!179 = distinct !{!179, !169, !180, !68}
!180 = !DILocation(line: 98, column: 9, scope: !163)
!181 = !DILocation(line: 99, column: 9, scope: !153)
!182 = !DILocation(line: 99, column: 20, scope: !153)
!183 = !DILocation(line: 100, column: 19, scope: !153)
!184 = !DILocation(line: 100, column: 9, scope: !153)
!185 = !DILocation(line: 101, column: 14, scope: !153)
!186 = !DILocation(line: 101, column: 9, scope: !153)
!187 = !DILocation(line: 103, column: 1, scope: !143)
