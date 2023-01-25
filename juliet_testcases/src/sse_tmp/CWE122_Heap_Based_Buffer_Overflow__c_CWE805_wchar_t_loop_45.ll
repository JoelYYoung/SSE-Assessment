; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_badData, align 8, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !75, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !80
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !81
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !87
  %cmp = icmp ult i64 %1, 100, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !93
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %5 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !94
  store i32 %3, i32* %arrayidx2, align 4, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %6, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !103
  store i32 0, i32* %arrayidx3, align 4, !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %8), !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  %10 = bitcast i32* %9 to i8*, !dbg !107
  call void @free(i8* %10) #5, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store i32* null, i32** %data, align 8, !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %3 = load i32*, i32** %data, align 8, !dbg !125
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_goodG2BData, align 8, !dbg !126
  call void @goodG2BSink(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_goodG2BData, align 8, !dbg !132
  store i32* %0, i32** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !138
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !139
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %1, 100, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !151
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !151
  %4 = load i32*, i32** %data, align 8, !dbg !152
  %5 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !152
  store i32 %3, i32* %arrayidx2, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %6, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !160
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !160
  store i32 0, i32* %arrayidx3, align 4, !dbg !161
  %8 = load i32*, i32** %data, align 8, !dbg !162
  call void @printWLine(i32* %8), !dbg !163
  %9 = load i32*, i32** %data, align 8, !dbg !164
  %10 = bitcast i32* %9 to i8*, !dbg !164
  call void @free(i8* %10) #5, !dbg !165
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_bad", scope: !15, file: !15, line: 45, type: !23, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 47, type: !6)
!26 = !DILocation(line: 47, column: 15, scope: !22)
!27 = !DILocation(line: 48, column: 10, scope: !22)
!28 = !DILocation(line: 50, column: 23, scope: !22)
!29 = !DILocation(line: 50, column: 12, scope: !22)
!30 = !DILocation(line: 50, column: 10, scope: !22)
!31 = !DILocation(line: 51, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 51, column: 9)
!33 = !DILocation(line: 51, column: 14, scope: !32)
!34 = !DILocation(line: 51, column: 9, scope: !22)
!35 = !DILocation(line: 51, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 51, column: 23)
!37 = !DILocation(line: 52, column: 5, scope: !22)
!38 = !DILocation(line: 52, column: 13, scope: !22)
!39 = !DILocation(line: 53, column: 75, scope: !22)
!40 = !DILocation(line: 53, column: 73, scope: !22)
!41 = !DILocation(line: 54, column: 5, scope: !22)
!42 = !DILocation(line: 55, column: 1, scope: !22)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_45_good", scope: !15, file: !15, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 95, column: 5, scope: !43)
!45 = !DILocation(line: 96, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 107, type: !47, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!9, !9, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 107, type: !9)
!53 = !DILocation(line: 107, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 107, type: !49)
!55 = !DILocation(line: 107, column: 27, scope: !46)
!56 = !DILocation(line: 110, column: 22, scope: !46)
!57 = !DILocation(line: 110, column: 12, scope: !46)
!58 = !DILocation(line: 110, column: 5, scope: !46)
!59 = !DILocation(line: 112, column: 5, scope: !46)
!60 = !DILocation(line: 113, column: 5, scope: !46)
!61 = !DILocation(line: 114, column: 5, scope: !46)
!62 = !DILocation(line: 117, column: 5, scope: !46)
!63 = !DILocation(line: 118, column: 5, scope: !46)
!64 = !DILocation(line: 119, column: 5, scope: !46)
!65 = !DILocation(line: 121, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 28, type: !6)
!68 = !DILocation(line: 28, column: 15, scope: !66)
!69 = !DILocation(line: 28, column: 22, scope: !66)
!70 = !DILocalVariable(name: "i", scope: !71, file: !15, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !15, line: 29, column: 5)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !73)
!73 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!74 = !DILocation(line: 30, column: 16, scope: !71)
!75 = !DILocalVariable(name: "source", scope: !71, file: !15, line: 31, type: !76)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 100)
!79 = !DILocation(line: 31, column: 17, scope: !71)
!80 = !DILocation(line: 32, column: 17, scope: !71)
!81 = !DILocation(line: 32, column: 9, scope: !71)
!82 = !DILocation(line: 33, column: 9, scope: !71)
!83 = !DILocation(line: 33, column: 23, scope: !71)
!84 = !DILocation(line: 35, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !71, file: !15, line: 35, column: 9)
!86 = !DILocation(line: 35, column: 14, scope: !85)
!87 = !DILocation(line: 35, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 35, column: 9)
!89 = !DILocation(line: 35, column: 23, scope: !88)
!90 = !DILocation(line: 35, column: 9, scope: !85)
!91 = !DILocation(line: 37, column: 30, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 36, column: 9)
!93 = !DILocation(line: 37, column: 23, scope: !92)
!94 = !DILocation(line: 37, column: 13, scope: !92)
!95 = !DILocation(line: 37, column: 18, scope: !92)
!96 = !DILocation(line: 37, column: 21, scope: !92)
!97 = !DILocation(line: 38, column: 9, scope: !92)
!98 = !DILocation(line: 35, column: 31, scope: !88)
!99 = !DILocation(line: 35, column: 9, scope: !88)
!100 = distinct !{!100, !90, !101, !102}
!101 = !DILocation(line: 38, column: 9, scope: !85)
!102 = !{!"llvm.loop.mustprogress"}
!103 = !DILocation(line: 39, column: 9, scope: !71)
!104 = !DILocation(line: 39, column: 21, scope: !71)
!105 = !DILocation(line: 40, column: 20, scope: !71)
!106 = !DILocation(line: 40, column: 9, scope: !71)
!107 = !DILocation(line: 41, column: 14, scope: !71)
!108 = !DILocation(line: 41, column: 9, scope: !71)
!109 = !DILocation(line: 43, column: 1, scope: !66)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 81, type: !23, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 83, type: !6)
!112 = !DILocation(line: 83, column: 15, scope: !110)
!113 = !DILocation(line: 84, column: 10, scope: !110)
!114 = !DILocation(line: 86, column: 23, scope: !110)
!115 = !DILocation(line: 86, column: 12, scope: !110)
!116 = !DILocation(line: 86, column: 10, scope: !110)
!117 = !DILocation(line: 87, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !15, line: 87, column: 9)
!119 = !DILocation(line: 87, column: 14, scope: !118)
!120 = !DILocation(line: 87, column: 9, scope: !110)
!121 = !DILocation(line: 87, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 87, column: 23)
!123 = !DILocation(line: 88, column: 5, scope: !110)
!124 = !DILocation(line: 88, column: 13, scope: !110)
!125 = !DILocation(line: 89, column: 79, scope: !110)
!126 = !DILocation(line: 89, column: 77, scope: !110)
!127 = !DILocation(line: 90, column: 5, scope: !110)
!128 = !DILocation(line: 91, column: 1, scope: !110)
!129 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 62, type: !23, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !15, line: 64, type: !6)
!131 = !DILocation(line: 64, column: 15, scope: !129)
!132 = !DILocation(line: 64, column: 22, scope: !129)
!133 = !DILocalVariable(name: "i", scope: !134, file: !15, line: 66, type: !72)
!134 = distinct !DILexicalBlock(scope: !129, file: !15, line: 65, column: 5)
!135 = !DILocation(line: 66, column: 16, scope: !134)
!136 = !DILocalVariable(name: "source", scope: !134, file: !15, line: 67, type: !76)
!137 = !DILocation(line: 67, column: 17, scope: !134)
!138 = !DILocation(line: 68, column: 17, scope: !134)
!139 = !DILocation(line: 68, column: 9, scope: !134)
!140 = !DILocation(line: 69, column: 9, scope: !134)
!141 = !DILocation(line: 69, column: 23, scope: !134)
!142 = !DILocation(line: 71, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !134, file: !15, line: 71, column: 9)
!144 = !DILocation(line: 71, column: 14, scope: !143)
!145 = !DILocation(line: 71, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !15, line: 71, column: 9)
!147 = !DILocation(line: 71, column: 23, scope: !146)
!148 = !DILocation(line: 71, column: 9, scope: !143)
!149 = !DILocation(line: 73, column: 30, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 72, column: 9)
!151 = !DILocation(line: 73, column: 23, scope: !150)
!152 = !DILocation(line: 73, column: 13, scope: !150)
!153 = !DILocation(line: 73, column: 18, scope: !150)
!154 = !DILocation(line: 73, column: 21, scope: !150)
!155 = !DILocation(line: 74, column: 9, scope: !150)
!156 = !DILocation(line: 71, column: 31, scope: !146)
!157 = !DILocation(line: 71, column: 9, scope: !146)
!158 = distinct !{!158, !148, !159, !102}
!159 = !DILocation(line: 74, column: 9, scope: !143)
!160 = !DILocation(line: 75, column: 9, scope: !134)
!161 = !DILocation(line: 75, column: 21, scope: !134)
!162 = !DILocation(line: 76, column: 20, scope: !134)
!163 = !DILocation(line: 76, column: 9, scope: !134)
!164 = !DILocation(line: 77, column: 14, scope: !134)
!165 = !DILocation(line: 77, column: 9, scope: !134)
!166 = !DILocation(line: 79, column: 1, scope: !129)
