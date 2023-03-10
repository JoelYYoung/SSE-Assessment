; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !44
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !56
  %4 = load i32*, i32** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !57
  store i32 %3, i32* %arrayidx3, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %8 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %8), !dbg !69
  %9 = load i32*, i32** %data, align 8, !dbg !70
  %10 = bitcast i32* %9 to i8*, !dbg !70
  call void @free(i8* %10) #4, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #4, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #4, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B1Global, align 4, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B1Source(i32* %0), !dbg !103
  store i32* %call, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !111
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %1, 100, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !123
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !123
  %4 = load i32*, i32** %data, align 8, !dbg !124
  %5 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !124
  store i32 %3, i32* %arrayidx3, align 4, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %6, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !132
  store i32 0, i32* %arrayidx4, align 4, !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %8), !dbg !135
  %9 = load i32*, i32** %data, align 8, !dbg !136
  %10 = bitcast i32* %9 to i8*, !dbg !136
  call void @free(i8* %10) #4, !dbg !137
  ret void, !dbg !138
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i32* null, i32** %data, align 8, !dbg !142
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B2Global, align 4, !dbg !143
  %0 = load i32*, i32** %data, align 8, !dbg !144
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B2Source(i32* %0), !dbg !145
  store i32* %call, i32** %data, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !152
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !153
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !159
  %cmp = icmp ult i64 %1, 100, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !165
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !165
  %4 = load i32*, i32** %data, align 8, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !166
  store i32 %3, i32* %arrayidx3, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %6, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !174
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !174
  store i32 0, i32* %arrayidx4, align 4, !dbg !175
  %8 = load i32*, i32** %data, align 8, !dbg !176
  call void @printWLine(i32* %8), !dbg !177
  %9 = load i32*, i32** %data, align 8, !dbg !178
  %10 = bitcast i32* %9 to i8*, !dbg !178
  call void @free(i8* %10) #4, !dbg !179
  ret void, !dbg !180
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B1Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_goodG2B2Global", scope: !2, file: !10, line: 56, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 75, scope: !20)
!30 = !DILocation(line: 33, column: 82, scope: !20)
!31 = !DILocation(line: 33, column: 12, scope: !20)
!32 = !DILocation(line: 33, column: 10, scope: !20)
!33 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 35, column: 16, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !34, file: !10, line: 36, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 17, scope: !34)
!43 = !DILocation(line: 37, column: 17, scope: !34)
!44 = !DILocation(line: 37, column: 9, scope: !34)
!45 = !DILocation(line: 38, column: 9, scope: !34)
!46 = !DILocation(line: 38, column: 23, scope: !34)
!47 = !DILocation(line: 40, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !10, line: 40, column: 9)
!49 = !DILocation(line: 40, column: 14, scope: !48)
!50 = !DILocation(line: 40, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 23, scope: !51)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 42, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 41, column: 9)
!56 = !DILocation(line: 42, column: 23, scope: !55)
!57 = !DILocation(line: 42, column: 13, scope: !55)
!58 = !DILocation(line: 42, column: 18, scope: !55)
!59 = !DILocation(line: 42, column: 21, scope: !55)
!60 = !DILocation(line: 43, column: 9, scope: !55)
!61 = !DILocation(line: 40, column: 31, scope: !51)
!62 = !DILocation(line: 40, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 43, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 44, column: 9, scope: !34)
!67 = !DILocation(line: 44, column: 21, scope: !34)
!68 = !DILocation(line: 45, column: 20, scope: !34)
!69 = !DILocation(line: 45, column: 9, scope: !34)
!70 = !DILocation(line: 46, column: 14, scope: !34)
!71 = !DILocation(line: 46, column: 9, scope: !34)
!72 = !DILocation(line: 48, column: 1, scope: !20)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_22_good", scope: !10, file: !10, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 110, column: 5, scope: !73)
!75 = !DILocation(line: 111, column: 5, scope: !73)
!76 = !DILocation(line: 112, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 124, type: !78, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DISubroutineType(types: !79)
!79 = !{!11, !11, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !10, line: 124, type: !11)
!84 = !DILocation(line: 124, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !10, line: 124, type: !80)
!86 = !DILocation(line: 124, column: 27, scope: !77)
!87 = !DILocation(line: 127, column: 22, scope: !77)
!88 = !DILocation(line: 127, column: 12, scope: !77)
!89 = !DILocation(line: 127, column: 5, scope: !77)
!90 = !DILocation(line: 129, column: 5, scope: !77)
!91 = !DILocation(line: 130, column: 5, scope: !77)
!92 = !DILocation(line: 131, column: 5, scope: !77)
!93 = !DILocation(line: 134, column: 5, scope: !77)
!94 = !DILocation(line: 135, column: 5, scope: !77)
!95 = !DILocation(line: 136, column: 5, scope: !77)
!96 = !DILocation(line: 138, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !10, line: 63, type: !24)
!99 = !DILocation(line: 63, column: 15, scope: !97)
!100 = !DILocation(line: 64, column: 10, scope: !97)
!101 = !DILocation(line: 65, column: 80, scope: !97)
!102 = !DILocation(line: 66, column: 87, scope: !97)
!103 = !DILocation(line: 66, column: 12, scope: !97)
!104 = !DILocation(line: 66, column: 10, scope: !97)
!105 = !DILocalVariable(name: "i", scope: !106, file: !10, line: 68, type: !35)
!106 = distinct !DILexicalBlock(scope: !97, file: !10, line: 67, column: 5)
!107 = !DILocation(line: 68, column: 16, scope: !106)
!108 = !DILocalVariable(name: "source", scope: !106, file: !10, line: 69, type: !39)
!109 = !DILocation(line: 69, column: 17, scope: !106)
!110 = !DILocation(line: 70, column: 17, scope: !106)
!111 = !DILocation(line: 70, column: 9, scope: !106)
!112 = !DILocation(line: 71, column: 9, scope: !106)
!113 = !DILocation(line: 71, column: 23, scope: !106)
!114 = !DILocation(line: 73, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !10, line: 73, column: 9)
!116 = !DILocation(line: 73, column: 14, scope: !115)
!117 = !DILocation(line: 73, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !10, line: 73, column: 9)
!119 = !DILocation(line: 73, column: 23, scope: !118)
!120 = !DILocation(line: 73, column: 9, scope: !115)
!121 = !DILocation(line: 75, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !10, line: 74, column: 9)
!123 = !DILocation(line: 75, column: 23, scope: !122)
!124 = !DILocation(line: 75, column: 13, scope: !122)
!125 = !DILocation(line: 75, column: 18, scope: !122)
!126 = !DILocation(line: 75, column: 21, scope: !122)
!127 = !DILocation(line: 76, column: 9, scope: !122)
!128 = !DILocation(line: 73, column: 31, scope: !118)
!129 = !DILocation(line: 73, column: 9, scope: !118)
!130 = distinct !{!130, !120, !131, !65}
!131 = !DILocation(line: 76, column: 9, scope: !115)
!132 = !DILocation(line: 77, column: 9, scope: !106)
!133 = !DILocation(line: 77, column: 21, scope: !106)
!134 = !DILocation(line: 78, column: 20, scope: !106)
!135 = !DILocation(line: 78, column: 9, scope: !106)
!136 = !DILocation(line: 79, column: 14, scope: !106)
!137 = !DILocation(line: 79, column: 9, scope: !106)
!138 = !DILocation(line: 81, column: 1, scope: !97)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !10, line: 88, type: !24)
!141 = !DILocation(line: 88, column: 15, scope: !139)
!142 = !DILocation(line: 89, column: 10, scope: !139)
!143 = !DILocation(line: 90, column: 80, scope: !139)
!144 = !DILocation(line: 91, column: 87, scope: !139)
!145 = !DILocation(line: 91, column: 12, scope: !139)
!146 = !DILocation(line: 91, column: 10, scope: !139)
!147 = !DILocalVariable(name: "i", scope: !148, file: !10, line: 93, type: !35)
!148 = distinct !DILexicalBlock(scope: !139, file: !10, line: 92, column: 5)
!149 = !DILocation(line: 93, column: 16, scope: !148)
!150 = !DILocalVariable(name: "source", scope: !148, file: !10, line: 94, type: !39)
!151 = !DILocation(line: 94, column: 17, scope: !148)
!152 = !DILocation(line: 95, column: 17, scope: !148)
!153 = !DILocation(line: 95, column: 9, scope: !148)
!154 = !DILocation(line: 96, column: 9, scope: !148)
!155 = !DILocation(line: 96, column: 23, scope: !148)
!156 = !DILocation(line: 98, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !148, file: !10, line: 98, column: 9)
!158 = !DILocation(line: 98, column: 14, scope: !157)
!159 = !DILocation(line: 98, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !10, line: 98, column: 9)
!161 = !DILocation(line: 98, column: 23, scope: !160)
!162 = !DILocation(line: 98, column: 9, scope: !157)
!163 = !DILocation(line: 100, column: 30, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !10, line: 99, column: 9)
!165 = !DILocation(line: 100, column: 23, scope: !164)
!166 = !DILocation(line: 100, column: 13, scope: !164)
!167 = !DILocation(line: 100, column: 18, scope: !164)
!168 = !DILocation(line: 100, column: 21, scope: !164)
!169 = !DILocation(line: 101, column: 9, scope: !164)
!170 = !DILocation(line: 98, column: 31, scope: !160)
!171 = !DILocation(line: 98, column: 9, scope: !160)
!172 = distinct !{!172, !162, !173, !65}
!173 = !DILocation(line: 101, column: 9, scope: !157)
!174 = !DILocation(line: 102, column: 9, scope: !148)
!175 = !DILocation(line: 102, column: 21, scope: !148)
!176 = !DILocation(line: 103, column: 20, scope: !148)
!177 = !DILocation(line: 103, column: 9, scope: !148)
!178 = !DILocation(line: 104, column: 14, scope: !148)
!179 = !DILocation(line: 104, column: 9, scope: !148)
!180 = !DILocation(line: 106, column: 1, scope: !139)
