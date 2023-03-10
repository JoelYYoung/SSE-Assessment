; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_badGlobal, align 4, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %2, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !52
  %4 = load i32, i32* %arrayidx, align 4, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !53
  store i32 %4, i32* %arrayidx1, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %7, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !62
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !62
  call void @printIntLine(i32 %9), !dbg !63
  %10 = load i32*, i32** %data, align 8, !dbg !64
  %11 = bitcast i32* %10 to i8*, !dbg !64
  call void @free(i8* %11) #5, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B1Global, align 4, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B1Source(i32* %0), !dbg !97
  store i32* %call, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !108
  %cmp = icmp ult i64 %2, 100, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !114
  %4 = load i32, i32* %arrayidx, align 4, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %6 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !115
  store i32 %4, i32* %arrayidx1, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %7, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !123
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !123
  call void @printIntLine(i32 %9), !dbg !124
  %10 = load i32*, i32** %data, align 8, !dbg !125
  %11 = bitcast i32* %10 to i8*, !dbg !125
  call void @free(i8* %11) #5, !dbg !126
  ret void, !dbg !127
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store i32* null, i32** %data, align 8, !dbg !131
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B2Global, align 4, !dbg !132
  %0 = load i32*, i32** %data, align 8, !dbg !133
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B2Source(i32* %0), !dbg !134
  store i32* %call, i32** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %2, 100, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !151
  %4 = load i32, i32* %arrayidx, align 4, !dbg !151
  %5 = load i32*, i32** %data, align 8, !dbg !152
  %6 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !152
  store i32 %4, i32* %arrayidx1, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %7, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !160
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !160
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !160
  call void @printIntLine(i32 %9), !dbg !161
  %10 = load i32*, i32** %data, align 8, !dbg !162
  %11 = bitcast i32* %10 to i8*, !dbg !162
  call void @free(i8* %11) #5, !dbg !163
  ret void, !dbg !164
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B1Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_goodG2B2Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!25 = !DILocation(line: 28, column: 11, scope: !20)
!26 = !DILocation(line: 29, column: 10, scope: !20)
!27 = !DILocation(line: 30, column: 71, scope: !20)
!28 = !DILocation(line: 31, column: 78, scope: !20)
!29 = !DILocation(line: 31, column: 12, scope: !20)
!30 = !DILocation(line: 31, column: 10, scope: !20)
!31 = !DILocalVariable(name: "source", scope: !32, file: !10, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 13, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !10, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !10, line: 34, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 20, scope: !38)
!43 = !DILocation(line: 37, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 37, column: 13)
!45 = !DILocation(line: 37, column: 18, scope: !44)
!46 = !DILocation(line: 37, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !10, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 27, scope: !47)
!49 = !DILocation(line: 37, column: 13, scope: !44)
!50 = !DILocation(line: 39, column: 34, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !10, line: 38, column: 13)
!52 = !DILocation(line: 39, column: 27, scope: !51)
!53 = !DILocation(line: 39, column: 17, scope: !51)
!54 = !DILocation(line: 39, column: 22, scope: !51)
!55 = !DILocation(line: 39, column: 25, scope: !51)
!56 = !DILocation(line: 40, column: 13, scope: !51)
!57 = !DILocation(line: 37, column: 35, scope: !47)
!58 = !DILocation(line: 37, column: 13, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 40, column: 13, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 41, column: 26, scope: !38)
!63 = !DILocation(line: 41, column: 13, scope: !38)
!64 = !DILocation(line: 42, column: 18, scope: !38)
!65 = !DILocation(line: 42, column: 13, scope: !38)
!66 = !DILocation(line: 45, column: 1, scope: !20)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_22_good", scope: !10, file: !10, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 105, column: 5, scope: !67)
!69 = !DILocation(line: 106, column: 5, scope: !67)
!70 = !DILocation(line: 107, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 119, type: !72, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!11, !11, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !10, line: 119, type: !11)
!78 = !DILocation(line: 119, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !10, line: 119, type: !74)
!80 = !DILocation(line: 119, column: 27, scope: !71)
!81 = !DILocation(line: 122, column: 22, scope: !71)
!82 = !DILocation(line: 122, column: 12, scope: !71)
!83 = !DILocation(line: 122, column: 5, scope: !71)
!84 = !DILocation(line: 124, column: 5, scope: !71)
!85 = !DILocation(line: 125, column: 5, scope: !71)
!86 = !DILocation(line: 126, column: 5, scope: !71)
!87 = !DILocation(line: 129, column: 5, scope: !71)
!88 = !DILocation(line: 130, column: 5, scope: !71)
!89 = !DILocation(line: 131, column: 5, scope: !71)
!90 = !DILocation(line: 133, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !10, line: 60, type: !24)
!93 = !DILocation(line: 60, column: 11, scope: !91)
!94 = !DILocation(line: 61, column: 10, scope: !91)
!95 = !DILocation(line: 62, column: 76, scope: !91)
!96 = !DILocation(line: 63, column: 83, scope: !91)
!97 = !DILocation(line: 63, column: 12, scope: !91)
!98 = !DILocation(line: 63, column: 10, scope: !91)
!99 = !DILocalVariable(name: "source", scope: !100, file: !10, line: 65, type: !33)
!100 = distinct !DILexicalBlock(scope: !91, file: !10, line: 64, column: 5)
!101 = !DILocation(line: 65, column: 13, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !10, line: 67, type: !39)
!103 = distinct !DILexicalBlock(scope: !100, file: !10, line: 66, column: 9)
!104 = !DILocation(line: 67, column: 20, scope: !103)
!105 = !DILocation(line: 69, column: 20, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !10, line: 69, column: 13)
!107 = !DILocation(line: 69, column: 18, scope: !106)
!108 = !DILocation(line: 69, column: 25, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !10, line: 69, column: 13)
!110 = !DILocation(line: 69, column: 27, scope: !109)
!111 = !DILocation(line: 69, column: 13, scope: !106)
!112 = !DILocation(line: 71, column: 34, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !10, line: 70, column: 13)
!114 = !DILocation(line: 71, column: 27, scope: !113)
!115 = !DILocation(line: 71, column: 17, scope: !113)
!116 = !DILocation(line: 71, column: 22, scope: !113)
!117 = !DILocation(line: 71, column: 25, scope: !113)
!118 = !DILocation(line: 72, column: 13, scope: !113)
!119 = !DILocation(line: 69, column: 35, scope: !109)
!120 = !DILocation(line: 69, column: 13, scope: !109)
!121 = distinct !{!121, !111, !122, !61}
!122 = !DILocation(line: 72, column: 13, scope: !106)
!123 = !DILocation(line: 73, column: 26, scope: !103)
!124 = !DILocation(line: 73, column: 13, scope: !103)
!125 = !DILocation(line: 74, column: 18, scope: !103)
!126 = !DILocation(line: 74, column: 13, scope: !103)
!127 = !DILocation(line: 77, column: 1, scope: !91)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !10, line: 84, type: !24)
!130 = !DILocation(line: 84, column: 11, scope: !128)
!131 = !DILocation(line: 85, column: 10, scope: !128)
!132 = !DILocation(line: 86, column: 76, scope: !128)
!133 = !DILocation(line: 87, column: 83, scope: !128)
!134 = !DILocation(line: 87, column: 12, scope: !128)
!135 = !DILocation(line: 87, column: 10, scope: !128)
!136 = !DILocalVariable(name: "source", scope: !137, file: !10, line: 89, type: !33)
!137 = distinct !DILexicalBlock(scope: !128, file: !10, line: 88, column: 5)
!138 = !DILocation(line: 89, column: 13, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !10, line: 91, type: !39)
!140 = distinct !DILexicalBlock(scope: !137, file: !10, line: 90, column: 9)
!141 = !DILocation(line: 91, column: 20, scope: !140)
!142 = !DILocation(line: 93, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !10, line: 93, column: 13)
!144 = !DILocation(line: 93, column: 18, scope: !143)
!145 = !DILocation(line: 93, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !10, line: 93, column: 13)
!147 = !DILocation(line: 93, column: 27, scope: !146)
!148 = !DILocation(line: 93, column: 13, scope: !143)
!149 = !DILocation(line: 95, column: 34, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !10, line: 94, column: 13)
!151 = !DILocation(line: 95, column: 27, scope: !150)
!152 = !DILocation(line: 95, column: 17, scope: !150)
!153 = !DILocation(line: 95, column: 22, scope: !150)
!154 = !DILocation(line: 95, column: 25, scope: !150)
!155 = !DILocation(line: 96, column: 13, scope: !150)
!156 = !DILocation(line: 93, column: 35, scope: !146)
!157 = !DILocation(line: 93, column: 13, scope: !146)
!158 = distinct !{!158, !148, !159, !61}
!159 = !DILocation(line: 96, column: 13, scope: !143)
!160 = !DILocation(line: 97, column: 26, scope: !140)
!161 = !DILocation(line: 97, column: 13, scope: !140)
!162 = !DILocation(line: 98, column: 18, scope: !140)
!163 = !DILocation(line: 98, column: 13, scope: !140)
!164 = !DILocation(line: 101, column: 1, scope: !128)
