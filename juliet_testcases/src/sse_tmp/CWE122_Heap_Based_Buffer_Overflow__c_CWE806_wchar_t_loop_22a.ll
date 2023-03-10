; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_badGlobal, align 4, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_badSource(i32* %1), !dbg !33
  store i32* %call1, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !48
  store i64 %call2, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !53
  %5 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp = icmp ult i64 %4, %5, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !58
  %8 = load i32, i32* %arrayidx, align 4, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !62
  store i32 %8, i32* %arrayidx3, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %10, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !70
  store i32 0, i32* %arrayidx4, align 4, !dbg !71
  %11 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %11), !dbg !73
  %12 = load i32*, i32** %data, align 8, !dbg !74
  %13 = bitcast i32* %12 to i8*, !dbg !74
  call void @free(i8* %13) #6, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_badSource(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !104
  %0 = bitcast i8* %call to i32*, !dbg !105
  store i32* %0, i32** %data, align 8, !dbg !106
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B1Global, align 4, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B1Source(i32* %1), !dbg !109
  store i32* %call1, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !116, metadata !DIExpression()), !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !119
  store i64 %call2, i64* %dataLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !124
  %5 = load i64, i64* %dataLen, align 8, !dbg !126
  %cmp = icmp ult i64 %4, %5, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !129
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !129
  %8 = load i32, i32* %arrayidx, align 4, !dbg !129
  %9 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !133
  store i32 %8, i32* %arrayidx3, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %10, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !140
  store i32 0, i32* %arrayidx4, align 4, !dbg !141
  %11 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %11), !dbg !143
  %12 = load i32*, i32** %data, align 8, !dbg !144
  %13 = bitcast i32* %12 to i8*, !dbg !144
  call void @free(i8* %13) #6, !dbg !145
  ret void, !dbg !146
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B1Source(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !150
  %0 = bitcast i8* %call to i32*, !dbg !151
  store i32* %0, i32** %data, align 8, !dbg !152
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B2Global, align 4, !dbg !153
  %1 = load i32*, i32** %data, align 8, !dbg !154
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B2Source(i32* %1), !dbg !155
  store i32* %call1, i32** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !157, metadata !DIExpression()), !dbg !159
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !162, metadata !DIExpression()), !dbg !163
  %3 = load i32*, i32** %data, align 8, !dbg !164
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !165
  store i64 %call2, i64* %dataLen, align 8, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !170
  %5 = load i64, i64* %dataLen, align 8, !dbg !172
  %cmp = icmp ult i64 %4, %5, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !175
  %7 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !175
  %8 = load i32, i32* %arrayidx, align 4, !dbg !175
  %9 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !179
  store i32 %8, i32* %arrayidx3, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %10, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !186
  store i32 0, i32* %arrayidx4, align 4, !dbg !187
  %11 = load i32*, i32** %data, align 8, !dbg !188
  call void @printWLine(i32* %11), !dbg !189
  %12 = load i32*, i32** %data, align 8, !dbg !190
  %13 = bitcast i32* %12 to i8*, !dbg !190
  call void @free(i8* %13) #6, !dbg !191
  ret void, !dbg !192
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B2Source(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_badGlobal", scope: !2, file: !14, line: 24, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B1Global", scope: !2, file: !14, line: 54, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_goodG2B2Global", scope: !2, file: !14, line: 55, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_bad", scope: !14, file: !14, line: 28, type: !24, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 30, type: !6)
!27 = !DILocation(line: 30, column: 15, scope: !23)
!28 = !DILocation(line: 31, column: 23, scope: !23)
!29 = !DILocation(line: 31, column: 12, scope: !23)
!30 = !DILocation(line: 31, column: 10, scope: !23)
!31 = !DILocation(line: 32, column: 75, scope: !23)
!32 = !DILocation(line: 33, column: 82, scope: !23)
!33 = !DILocation(line: 33, column: 12, scope: !23)
!34 = !DILocation(line: 33, column: 10, scope: !23)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !23, file: !14, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 36, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !36)
!45 = !DILocalVariable(name: "dataLen", scope: !36, file: !14, line: 36, type: !42)
!46 = !DILocation(line: 36, column: 19, scope: !36)
!47 = !DILocation(line: 37, column: 26, scope: !36)
!48 = !DILocation(line: 37, column: 19, scope: !36)
!49 = !DILocation(line: 37, column: 17, scope: !36)
!50 = !DILocation(line: 39, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !36, file: !14, line: 39, column: 9)
!52 = !DILocation(line: 39, column: 14, scope: !51)
!53 = !DILocation(line: 39, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 25, scope: !54)
!56 = !DILocation(line: 39, column: 23, scope: !54)
!57 = !DILocation(line: 39, column: 9, scope: !51)
!58 = !DILocation(line: 41, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !14, line: 40, column: 9)
!60 = !DILocation(line: 41, column: 28, scope: !59)
!61 = !DILocation(line: 41, column: 18, scope: !59)
!62 = !DILocation(line: 41, column: 13, scope: !59)
!63 = !DILocation(line: 41, column: 21, scope: !59)
!64 = !DILocation(line: 42, column: 9, scope: !59)
!65 = !DILocation(line: 39, column: 35, scope: !54)
!66 = !DILocation(line: 39, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 42, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 43, column: 9, scope: !36)
!71 = !DILocation(line: 43, column: 20, scope: !36)
!72 = !DILocation(line: 44, column: 20, scope: !36)
!73 = !DILocation(line: 44, column: 9, scope: !36)
!74 = !DILocation(line: 45, column: 14, scope: !36)
!75 = !DILocation(line: 45, column: 9, scope: !36)
!76 = !DILocation(line: 47, column: 1, scope: !23)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_22_good", scope: !14, file: !14, line: 105, type: !24, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 107, column: 5, scope: !77)
!79 = !DILocation(line: 108, column: 5, scope: !77)
!80 = !DILocation(line: 109, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !82, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!9, !9, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !14, line: 121, type: !9)
!88 = !DILocation(line: 121, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !14, line: 121, type: !84)
!90 = !DILocation(line: 121, column: 27, scope: !81)
!91 = !DILocation(line: 124, column: 22, scope: !81)
!92 = !DILocation(line: 124, column: 12, scope: !81)
!93 = !DILocation(line: 124, column: 5, scope: !81)
!94 = !DILocation(line: 126, column: 5, scope: !81)
!95 = !DILocation(line: 127, column: 5, scope: !81)
!96 = !DILocation(line: 128, column: 5, scope: !81)
!97 = !DILocation(line: 131, column: 5, scope: !81)
!98 = !DILocation(line: 132, column: 5, scope: !81)
!99 = !DILocation(line: 133, column: 5, scope: !81)
!100 = !DILocation(line: 135, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 62, type: !6)
!103 = !DILocation(line: 62, column: 15, scope: !101)
!104 = !DILocation(line: 63, column: 23, scope: !101)
!105 = !DILocation(line: 63, column: 12, scope: !101)
!106 = !DILocation(line: 63, column: 10, scope: !101)
!107 = !DILocation(line: 64, column: 80, scope: !101)
!108 = !DILocation(line: 65, column: 87, scope: !101)
!109 = !DILocation(line: 65, column: 12, scope: !101)
!110 = !DILocation(line: 65, column: 10, scope: !101)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !14, line: 67, type: !37)
!112 = distinct !DILexicalBlock(scope: !101, file: !14, line: 66, column: 5)
!113 = !DILocation(line: 67, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !14, line: 68, type: !42)
!115 = !DILocation(line: 68, column: 16, scope: !112)
!116 = !DILocalVariable(name: "dataLen", scope: !112, file: !14, line: 68, type: !42)
!117 = !DILocation(line: 68, column: 19, scope: !112)
!118 = !DILocation(line: 69, column: 26, scope: !112)
!119 = !DILocation(line: 69, column: 19, scope: !112)
!120 = !DILocation(line: 69, column: 17, scope: !112)
!121 = !DILocation(line: 71, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !14, line: 71, column: 9)
!123 = !DILocation(line: 71, column: 14, scope: !122)
!124 = !DILocation(line: 71, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 71, column: 9)
!126 = !DILocation(line: 71, column: 25, scope: !125)
!127 = !DILocation(line: 71, column: 23, scope: !125)
!128 = !DILocation(line: 71, column: 9, scope: !122)
!129 = !DILocation(line: 73, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !14, line: 72, column: 9)
!131 = !DILocation(line: 73, column: 28, scope: !130)
!132 = !DILocation(line: 73, column: 18, scope: !130)
!133 = !DILocation(line: 73, column: 13, scope: !130)
!134 = !DILocation(line: 73, column: 21, scope: !130)
!135 = !DILocation(line: 74, column: 9, scope: !130)
!136 = !DILocation(line: 71, column: 35, scope: !125)
!137 = !DILocation(line: 71, column: 9, scope: !125)
!138 = distinct !{!138, !128, !139, !69}
!139 = !DILocation(line: 74, column: 9, scope: !122)
!140 = !DILocation(line: 75, column: 9, scope: !112)
!141 = !DILocation(line: 75, column: 20, scope: !112)
!142 = !DILocation(line: 76, column: 20, scope: !112)
!143 = !DILocation(line: 76, column: 9, scope: !112)
!144 = !DILocation(line: 77, column: 14, scope: !112)
!145 = !DILocation(line: 77, column: 9, scope: !112)
!146 = !DILocation(line: 79, column: 1, scope: !101)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !24, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !14, line: 86, type: !6)
!149 = !DILocation(line: 86, column: 15, scope: !147)
!150 = !DILocation(line: 87, column: 23, scope: !147)
!151 = !DILocation(line: 87, column: 12, scope: !147)
!152 = !DILocation(line: 87, column: 10, scope: !147)
!153 = !DILocation(line: 88, column: 80, scope: !147)
!154 = !DILocation(line: 89, column: 87, scope: !147)
!155 = !DILocation(line: 89, column: 12, scope: !147)
!156 = !DILocation(line: 89, column: 10, scope: !147)
!157 = !DILocalVariable(name: "dest", scope: !158, file: !14, line: 91, type: !37)
!158 = distinct !DILexicalBlock(scope: !147, file: !14, line: 90, column: 5)
!159 = !DILocation(line: 91, column: 17, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !158, file: !14, line: 92, type: !42)
!161 = !DILocation(line: 92, column: 16, scope: !158)
!162 = !DILocalVariable(name: "dataLen", scope: !158, file: !14, line: 92, type: !42)
!163 = !DILocation(line: 92, column: 19, scope: !158)
!164 = !DILocation(line: 93, column: 26, scope: !158)
!165 = !DILocation(line: 93, column: 19, scope: !158)
!166 = !DILocation(line: 93, column: 17, scope: !158)
!167 = !DILocation(line: 95, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !158, file: !14, line: 95, column: 9)
!169 = !DILocation(line: 95, column: 14, scope: !168)
!170 = !DILocation(line: 95, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !14, line: 95, column: 9)
!172 = !DILocation(line: 95, column: 25, scope: !171)
!173 = !DILocation(line: 95, column: 23, scope: !171)
!174 = !DILocation(line: 95, column: 9, scope: !168)
!175 = !DILocation(line: 97, column: 23, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !14, line: 96, column: 9)
!177 = !DILocation(line: 97, column: 28, scope: !176)
!178 = !DILocation(line: 97, column: 18, scope: !176)
!179 = !DILocation(line: 97, column: 13, scope: !176)
!180 = !DILocation(line: 97, column: 21, scope: !176)
!181 = !DILocation(line: 98, column: 9, scope: !176)
!182 = !DILocation(line: 95, column: 35, scope: !171)
!183 = !DILocation(line: 95, column: 9, scope: !171)
!184 = distinct !{!184, !174, !185, !69}
!185 = !DILocation(line: 98, column: 9, scope: !168)
!186 = !DILocation(line: 99, column: 9, scope: !158)
!187 = !DILocation(line: 99, column: 20, scope: !158)
!188 = !DILocation(line: 100, column: 20, scope: !158)
!189 = !DILocation(line: 100, column: 9, scope: !158)
!190 = !DILocation(line: 101, column: 14, scope: !158)
!191 = !DILocation(line: 101, column: 9, scope: !158)
!192 = !DILocation(line: 103, column: 1, scope: !147)
