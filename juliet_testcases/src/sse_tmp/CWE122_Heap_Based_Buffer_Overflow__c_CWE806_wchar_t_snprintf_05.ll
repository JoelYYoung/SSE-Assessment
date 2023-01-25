; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
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
  %2 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %2, 0, !dbg !36
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !38

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %call4 = call i64 @wcslen(i32* %6) #9, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %8), !dbg !57
  %9 = load i32*, i32** %data, align 8, !dbg !58
  %10 = bitcast i32* %9 to i8*, !dbg !58
  call void @free(i8* %10) #7, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !97
  %tobool = icmp ne i32 %2, 0, !dbg !97
  br i1 %tobool, label %if.then1, label %if.else, !dbg !99

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !100
  br label %if.end3, !dbg !102

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  %call4 = call i64 @wcslen(i32* %6) #9, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !115
  %8 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %8), !dbg !117
  %9 = load i32*, i32** %data, align 8, !dbg !118
  %10 = bitcast i32* %9 to i8*, !dbg !118
  call void @free(i8* %10) #7, !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !124
  %0 = bitcast i8* %call to i32*, !dbg !125
  store i32* %0, i32** %data, align 8, !dbg !126
  %1 = load i32*, i32** %data, align 8, !dbg !127
  %cmp = icmp eq i32* %1, null, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !131
  unreachable, !dbg !131

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !133
  %tobool = icmp ne i32 %2, 0, !dbg !133
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !135

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !138
  %4 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %if.end3, !dbg !141

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !144
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !145
  %6 = load i32*, i32** %data, align 8, !dbg !146
  %call4 = call i64 @wcslen(i32* %6) #9, !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !149
  %8 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %8), !dbg !151
  %9 = load i32*, i32** %data, align 8, !dbg !152
  %10 = bitcast i32* %9 to i8*, !dbg !152
  call void @free(i8* %10) #7, !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 32, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05_bad", scope: !15, file: !15, line: 36, type: !23, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 38, type: !6)
!26 = !DILocation(line: 38, column: 15, scope: !22)
!27 = !DILocation(line: 39, column: 23, scope: !22)
!28 = !DILocation(line: 39, column: 12, scope: !22)
!29 = !DILocation(line: 39, column: 10, scope: !22)
!30 = !DILocation(line: 40, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 40, column: 9)
!32 = !DILocation(line: 40, column: 14, scope: !31)
!33 = !DILocation(line: 40, column: 9, scope: !22)
!34 = !DILocation(line: 40, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 40, column: 23)
!36 = !DILocation(line: 41, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 8)
!38 = !DILocation(line: 41, column: 8, scope: !22)
!39 = !DILocation(line: 44, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 42, column: 5)
!41 = !DILocation(line: 44, column: 9, scope: !40)
!42 = !DILocation(line: 45, column: 9, scope: !40)
!43 = !DILocation(line: 45, column: 21, scope: !40)
!44 = !DILocation(line: 46, column: 5, scope: !40)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !15, line: 48, type: !47)
!46 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 48, column: 17, scope: !46)
!51 = !DILocation(line: 50, column: 18, scope: !46)
!52 = !DILocation(line: 50, column: 31, scope: !46)
!53 = !DILocation(line: 50, column: 24, scope: !46)
!54 = !DILocation(line: 50, column: 45, scope: !46)
!55 = !DILocation(line: 50, column: 9, scope: !46)
!56 = !DILocation(line: 51, column: 20, scope: !46)
!57 = !DILocation(line: 51, column: 9, scope: !46)
!58 = !DILocation(line: 52, column: 14, scope: !46)
!59 = !DILocation(line: 52, column: 9, scope: !46)
!60 = !DILocation(line: 54, column: 1, scope: !22)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_05_good", scope: !15, file: !15, line: 107, type: !23, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 109, column: 5, scope: !61)
!63 = !DILocation(line: 110, column: 5, scope: !61)
!64 = !DILocation(line: 111, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 123, type: !66, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 123, type: !9)
!72 = !DILocation(line: 123, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 123, type: !68)
!74 = !DILocation(line: 123, column: 27, scope: !65)
!75 = !DILocation(line: 126, column: 22, scope: !65)
!76 = !DILocation(line: 126, column: 12, scope: !65)
!77 = !DILocation(line: 126, column: 5, scope: !65)
!78 = !DILocation(line: 128, column: 5, scope: !65)
!79 = !DILocation(line: 129, column: 5, scope: !65)
!80 = !DILocation(line: 130, column: 5, scope: !65)
!81 = !DILocation(line: 133, column: 5, scope: !65)
!82 = !DILocation(line: 134, column: 5, scope: !65)
!83 = !DILocation(line: 135, column: 5, scope: !65)
!84 = !DILocation(line: 137, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !23, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 63, type: !6)
!87 = !DILocation(line: 63, column: 15, scope: !85)
!88 = !DILocation(line: 64, column: 23, scope: !85)
!89 = !DILocation(line: 64, column: 12, scope: !85)
!90 = !DILocation(line: 64, column: 10, scope: !85)
!91 = !DILocation(line: 65, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !15, line: 65, column: 9)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocation(line: 65, column: 9, scope: !85)
!95 = !DILocation(line: 65, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 65, column: 23)
!97 = !DILocation(line: 66, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !15, line: 66, column: 8)
!99 = !DILocation(line: 66, column: 8, scope: !85)
!100 = !DILocation(line: 69, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !15, line: 67, column: 5)
!102 = !DILocation(line: 70, column: 5, scope: !101)
!103 = !DILocation(line: 74, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !15, line: 72, column: 5)
!105 = !DILocation(line: 74, column: 9, scope: !104)
!106 = !DILocation(line: 75, column: 9, scope: !104)
!107 = !DILocation(line: 75, column: 20, scope: !104)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !15, line: 78, type: !47)
!109 = distinct !DILexicalBlock(scope: !85, file: !15, line: 77, column: 5)
!110 = !DILocation(line: 78, column: 17, scope: !109)
!111 = !DILocation(line: 80, column: 18, scope: !109)
!112 = !DILocation(line: 80, column: 31, scope: !109)
!113 = !DILocation(line: 80, column: 24, scope: !109)
!114 = !DILocation(line: 80, column: 45, scope: !109)
!115 = !DILocation(line: 80, column: 9, scope: !109)
!116 = !DILocation(line: 81, column: 20, scope: !109)
!117 = !DILocation(line: 81, column: 9, scope: !109)
!118 = !DILocation(line: 82, column: 14, scope: !109)
!119 = !DILocation(line: 82, column: 9, scope: !109)
!120 = !DILocation(line: 84, column: 1, scope: !85)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 89, type: !6)
!123 = !DILocation(line: 89, column: 15, scope: !121)
!124 = !DILocation(line: 90, column: 23, scope: !121)
!125 = !DILocation(line: 90, column: 12, scope: !121)
!126 = !DILocation(line: 90, column: 10, scope: !121)
!127 = !DILocation(line: 91, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !15, line: 91, column: 9)
!129 = !DILocation(line: 91, column: 14, scope: !128)
!130 = !DILocation(line: 91, column: 9, scope: !121)
!131 = !DILocation(line: 91, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 91, column: 23)
!133 = !DILocation(line: 92, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !121, file: !15, line: 92, column: 8)
!135 = !DILocation(line: 92, column: 8, scope: !121)
!136 = !DILocation(line: 95, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 93, column: 5)
!138 = !DILocation(line: 95, column: 9, scope: !137)
!139 = !DILocation(line: 96, column: 9, scope: !137)
!140 = !DILocation(line: 96, column: 20, scope: !137)
!141 = !DILocation(line: 97, column: 5, scope: !137)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !15, line: 99, type: !47)
!143 = distinct !DILexicalBlock(scope: !121, file: !15, line: 98, column: 5)
!144 = !DILocation(line: 99, column: 17, scope: !143)
!145 = !DILocation(line: 101, column: 18, scope: !143)
!146 = !DILocation(line: 101, column: 31, scope: !143)
!147 = !DILocation(line: 101, column: 24, scope: !143)
!148 = !DILocation(line: 101, column: 45, scope: !143)
!149 = !DILocation(line: 101, column: 9, scope: !143)
!150 = !DILocation(line: 102, column: 20, scope: !143)
!151 = !DILocation(line: 102, column: 9, scope: !143)
!152 = !DILocation(line: 103, column: 14, scope: !143)
!153 = !DILocation(line: 103, column: 9, scope: !143)
!154 = !DILocation(line: 105, column: 1, scope: !121)
