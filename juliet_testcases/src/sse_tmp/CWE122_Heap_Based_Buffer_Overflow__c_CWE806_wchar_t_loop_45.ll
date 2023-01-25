; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !81, metadata !DIExpression()), !dbg !82
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %call = call i64 @wcslen(i32* %2) #9, !dbg !84
  store i64 %call, i64* %dataLen, align 8, !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !89
  %4 = load i64, i64* %dataLen, align 8, !dbg !91
  %cmp = icmp ult i64 %3, %4, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %6 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !94
  %7 = load i32, i32* %arrayidx, align 4, !dbg !94
  %8 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !98
  store i32 %7, i32* %arrayidx1, align 4, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %9, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %10 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %10), !dbg !109
  %11 = load i32*, i32** %data, align 8, !dbg !110
  %12 = bitcast i32* %11 to i8*, !dbg !110
  call void @free(i8* %12) #7, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %cmp = icmp eq i32* %1, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !126
  %3 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %4 = load i32*, i32** %data, align 8, !dbg !129
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_goodG2BData, align 8, !dbg !130
  call void @goodG2BSink(), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_goodG2BData, align 8, !dbg !136
  store i32* %0, i32** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !142, metadata !DIExpression()), !dbg !143
  %2 = load i32*, i32** %data, align 8, !dbg !144
  %call = call i64 @wcslen(i32* %2) #9, !dbg !145
  store i64 %call, i64* %dataLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !150
  %4 = load i64, i64* %dataLen, align 8, !dbg !152
  %cmp = icmp ult i64 %3, %4, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !155
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !155
  %7 = load i32, i32* %arrayidx, align 4, !dbg !155
  %8 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !159
  store i32 %7, i32* %arrayidx1, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %9, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !166
  store i32 0, i32* %arrayidx2, align 4, !dbg !167
  %10 = load i32*, i32** %data, align 8, !dbg !168
  call void @printWLine(i32* %10), !dbg !169
  %11 = load i32*, i32** %data, align 8, !dbg !170
  %12 = bitcast i32* %11 to i8*, !dbg !170
  call void @free(i8* %12) #7, !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_bad", scope: !15, file: !15, line: 44, type: !23, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 46, type: !6)
!26 = !DILocation(line: 46, column: 15, scope: !22)
!27 = !DILocation(line: 47, column: 23, scope: !22)
!28 = !DILocation(line: 47, column: 12, scope: !22)
!29 = !DILocation(line: 47, column: 10, scope: !22)
!30 = !DILocation(line: 48, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 48, column: 9)
!32 = !DILocation(line: 48, column: 14, scope: !31)
!33 = !DILocation(line: 48, column: 9, scope: !22)
!34 = !DILocation(line: 48, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 48, column: 23)
!36 = !DILocation(line: 50, column: 13, scope: !22)
!37 = !DILocation(line: 50, column: 5, scope: !22)
!38 = !DILocation(line: 51, column: 5, scope: !22)
!39 = !DILocation(line: 51, column: 17, scope: !22)
!40 = !DILocation(line: 52, column: 75, scope: !22)
!41 = !DILocation(line: 52, column: 73, scope: !22)
!42 = !DILocation(line: 53, column: 5, scope: !22)
!43 = !DILocation(line: 54, column: 1, scope: !22)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_45_good", scope: !15, file: !15, line: 91, type: !23, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 93, column: 5, scope: !44)
!46 = !DILocation(line: 94, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !48, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!9, !9, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 105, type: !9)
!54 = !DILocation(line: 105, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 105, type: !50)
!56 = !DILocation(line: 105, column: 27, scope: !47)
!57 = !DILocation(line: 108, column: 22, scope: !47)
!58 = !DILocation(line: 108, column: 12, scope: !47)
!59 = !DILocation(line: 108, column: 5, scope: !47)
!60 = !DILocation(line: 110, column: 5, scope: !47)
!61 = !DILocation(line: 111, column: 5, scope: !47)
!62 = !DILocation(line: 112, column: 5, scope: !47)
!63 = !DILocation(line: 115, column: 5, scope: !47)
!64 = !DILocation(line: 116, column: 5, scope: !47)
!65 = !DILocation(line: 117, column: 5, scope: !47)
!66 = !DILocation(line: 119, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 28, type: !6)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !72, file: !15, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !15, line: 29, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 50)
!76 = !DILocation(line: 30, column: 17, scope: !72)
!77 = !DILocalVariable(name: "i", scope: !72, file: !15, line: 31, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !79)
!79 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!80 = !DILocation(line: 31, column: 16, scope: !72)
!81 = !DILocalVariable(name: "dataLen", scope: !72, file: !15, line: 31, type: !78)
!82 = !DILocation(line: 31, column: 19, scope: !72)
!83 = !DILocation(line: 32, column: 26, scope: !72)
!84 = !DILocation(line: 32, column: 19, scope: !72)
!85 = !DILocation(line: 32, column: 17, scope: !72)
!86 = !DILocation(line: 34, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !72, file: !15, line: 34, column: 9)
!88 = !DILocation(line: 34, column: 14, scope: !87)
!89 = !DILocation(line: 34, column: 21, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 34, column: 9)
!91 = !DILocation(line: 34, column: 25, scope: !90)
!92 = !DILocation(line: 34, column: 23, scope: !90)
!93 = !DILocation(line: 34, column: 9, scope: !87)
!94 = !DILocation(line: 36, column: 23, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !15, line: 35, column: 9)
!96 = !DILocation(line: 36, column: 28, scope: !95)
!97 = !DILocation(line: 36, column: 18, scope: !95)
!98 = !DILocation(line: 36, column: 13, scope: !95)
!99 = !DILocation(line: 36, column: 21, scope: !95)
!100 = !DILocation(line: 37, column: 9, scope: !95)
!101 = !DILocation(line: 34, column: 35, scope: !90)
!102 = !DILocation(line: 34, column: 9, scope: !90)
!103 = distinct !{!103, !93, !104, !105}
!104 = !DILocation(line: 37, column: 9, scope: !87)
!105 = !{!"llvm.loop.mustprogress"}
!106 = !DILocation(line: 38, column: 9, scope: !72)
!107 = !DILocation(line: 38, column: 20, scope: !72)
!108 = !DILocation(line: 39, column: 20, scope: !72)
!109 = !DILocation(line: 39, column: 9, scope: !72)
!110 = !DILocation(line: 40, column: 14, scope: !72)
!111 = !DILocation(line: 40, column: 9, scope: !72)
!112 = !DILocation(line: 42, column: 1, scope: !67)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 79, type: !23, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 81, type: !6)
!115 = !DILocation(line: 81, column: 15, scope: !113)
!116 = !DILocation(line: 82, column: 23, scope: !113)
!117 = !DILocation(line: 82, column: 12, scope: !113)
!118 = !DILocation(line: 82, column: 10, scope: !113)
!119 = !DILocation(line: 83, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !15, line: 83, column: 9)
!121 = !DILocation(line: 83, column: 14, scope: !120)
!122 = !DILocation(line: 83, column: 9, scope: !113)
!123 = !DILocation(line: 83, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 83, column: 23)
!125 = !DILocation(line: 85, column: 13, scope: !113)
!126 = !DILocation(line: 85, column: 5, scope: !113)
!127 = !DILocation(line: 86, column: 5, scope: !113)
!128 = !DILocation(line: 86, column: 16, scope: !113)
!129 = !DILocation(line: 87, column: 79, scope: !113)
!130 = !DILocation(line: 87, column: 77, scope: !113)
!131 = !DILocation(line: 88, column: 5, scope: !113)
!132 = !DILocation(line: 89, column: 1, scope: !113)
!133 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 61, type: !23, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocalVariable(name: "data", scope: !133, file: !15, line: 63, type: !6)
!135 = !DILocation(line: 63, column: 15, scope: !133)
!136 = !DILocation(line: 63, column: 22, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !15, line: 65, type: !73)
!138 = distinct !DILexicalBlock(scope: !133, file: !15, line: 64, column: 5)
!139 = !DILocation(line: 65, column: 17, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !138, file: !15, line: 66, type: !78)
!141 = !DILocation(line: 66, column: 16, scope: !138)
!142 = !DILocalVariable(name: "dataLen", scope: !138, file: !15, line: 66, type: !78)
!143 = !DILocation(line: 66, column: 19, scope: !138)
!144 = !DILocation(line: 67, column: 26, scope: !138)
!145 = !DILocation(line: 67, column: 19, scope: !138)
!146 = !DILocation(line: 67, column: 17, scope: !138)
!147 = !DILocation(line: 69, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !15, line: 69, column: 9)
!149 = !DILocation(line: 69, column: 14, scope: !148)
!150 = !DILocation(line: 69, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !15, line: 69, column: 9)
!152 = !DILocation(line: 69, column: 25, scope: !151)
!153 = !DILocation(line: 69, column: 23, scope: !151)
!154 = !DILocation(line: 69, column: 9, scope: !148)
!155 = !DILocation(line: 71, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !15, line: 70, column: 9)
!157 = !DILocation(line: 71, column: 28, scope: !156)
!158 = !DILocation(line: 71, column: 18, scope: !156)
!159 = !DILocation(line: 71, column: 13, scope: !156)
!160 = !DILocation(line: 71, column: 21, scope: !156)
!161 = !DILocation(line: 72, column: 9, scope: !156)
!162 = !DILocation(line: 69, column: 35, scope: !151)
!163 = !DILocation(line: 69, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !105}
!165 = !DILocation(line: 72, column: 9, scope: !148)
!166 = !DILocation(line: 73, column: 9, scope: !138)
!167 = !DILocation(line: 73, column: 20, scope: !138)
!168 = !DILocation(line: 74, column: 20, scope: !138)
!169 = !DILocation(line: 74, column: 9, scope: !138)
!170 = !DILocation(line: 75, column: 14, scope: !138)
!171 = !DILocation(line: 75, column: 9, scope: !138)
!172 = !DILocation(line: 77, column: 1, scope: !133)
