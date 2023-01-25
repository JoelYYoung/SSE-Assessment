; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp1 = icmp eq i32 %2, 5, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !37

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end4, !dbg !43

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !49
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %8), !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = bitcast i32* %9 to i8*, !dbg !57
  call void @free(i8* %10) #7, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !96
  %cmp1 = icmp ne i32 %2, 5, !dbg !98
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !99

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !100
  br label %if.end4, !dbg !102

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !115
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
  %2 = load i32, i32* @staticFive, align 4, !dbg !133
  %cmp1 = icmp eq i32 %2, 5, !dbg !135
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !136

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !137
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !139
  %4 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  br label %if.end4, !dbg !142

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !143, metadata !DIExpression()), !dbg !145
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !145
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !146
  %6 = load i32*, i32** %data, align 8, !dbg !147
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !148
  %7 = load i32*, i32** %data, align 8, !dbg !149
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !150
  %8 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %8), !dbg !152
  %9 = load i32*, i32** %data, align 8, !dbg !153
  %10 = bitcast i32* %9 to i8*, !dbg !153
  call void @free(i8* %10) #7, !dbg !154
  ret void, !dbg !155
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07_bad", scope: !13, file: !13, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 15, scope: !20)
!25 = !DILocation(line: 38, column: 23, scope: !20)
!26 = !DILocation(line: 38, column: 12, scope: !20)
!27 = !DILocation(line: 38, column: 10, scope: !20)
!28 = !DILocation(line: 39, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 39, column: 9)
!30 = !DILocation(line: 39, column: 14, scope: !29)
!31 = !DILocation(line: 39, column: 9, scope: !20)
!32 = !DILocation(line: 39, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 39, column: 23)
!34 = !DILocation(line: 40, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 8)
!36 = !DILocation(line: 40, column: 18, scope: !35)
!37 = !DILocation(line: 40, column: 8, scope: !20)
!38 = !DILocation(line: 43, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 41, column: 5)
!40 = !DILocation(line: 43, column: 9, scope: !39)
!41 = !DILocation(line: 44, column: 9, scope: !39)
!42 = !DILocation(line: 44, column: 21, scope: !39)
!43 = !DILocation(line: 45, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !13, line: 47, type: !46)
!45 = distinct !DILexicalBlock(scope: !20, file: !13, line: 46, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 47, column: 17, scope: !45)
!50 = !DILocation(line: 49, column: 18, scope: !45)
!51 = !DILocation(line: 49, column: 31, scope: !45)
!52 = !DILocation(line: 49, column: 24, scope: !45)
!53 = !DILocation(line: 49, column: 45, scope: !45)
!54 = !DILocation(line: 49, column: 9, scope: !45)
!55 = !DILocation(line: 50, column: 20, scope: !45)
!56 = !DILocation(line: 50, column: 9, scope: !45)
!57 = !DILocation(line: 51, column: 14, scope: !45)
!58 = !DILocation(line: 51, column: 9, scope: !45)
!59 = !DILocation(line: 53, column: 1, scope: !20)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_07_good", scope: !13, file: !13, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 108, column: 5, scope: !60)
!62 = !DILocation(line: 109, column: 5, scope: !60)
!63 = !DILocation(line: 110, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 122, type: !65, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!9, !9, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !13, line: 122, type: !9)
!71 = !DILocation(line: 122, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !13, line: 122, type: !67)
!73 = !DILocation(line: 122, column: 27, scope: !64)
!74 = !DILocation(line: 125, column: 22, scope: !64)
!75 = !DILocation(line: 125, column: 12, scope: !64)
!76 = !DILocation(line: 125, column: 5, scope: !64)
!77 = !DILocation(line: 127, column: 5, scope: !64)
!78 = !DILocation(line: 128, column: 5, scope: !64)
!79 = !DILocation(line: 129, column: 5, scope: !64)
!80 = !DILocation(line: 132, column: 5, scope: !64)
!81 = !DILocation(line: 133, column: 5, scope: !64)
!82 = !DILocation(line: 134, column: 5, scope: !64)
!83 = !DILocation(line: 136, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !13, line: 62, type: !6)
!86 = !DILocation(line: 62, column: 15, scope: !84)
!87 = !DILocation(line: 63, column: 23, scope: !84)
!88 = !DILocation(line: 63, column: 12, scope: !84)
!89 = !DILocation(line: 63, column: 10, scope: !84)
!90 = !DILocation(line: 64, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !13, line: 64, column: 9)
!92 = !DILocation(line: 64, column: 14, scope: !91)
!93 = !DILocation(line: 64, column: 9, scope: !84)
!94 = !DILocation(line: 64, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !13, line: 64, column: 23)
!96 = !DILocation(line: 65, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !84, file: !13, line: 65, column: 8)
!98 = !DILocation(line: 65, column: 18, scope: !97)
!99 = !DILocation(line: 65, column: 8, scope: !84)
!100 = !DILocation(line: 68, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 66, column: 5)
!102 = !DILocation(line: 69, column: 5, scope: !101)
!103 = !DILocation(line: 73, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !13, line: 71, column: 5)
!105 = !DILocation(line: 73, column: 9, scope: !104)
!106 = !DILocation(line: 74, column: 9, scope: !104)
!107 = !DILocation(line: 74, column: 20, scope: !104)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !13, line: 77, type: !46)
!109 = distinct !DILexicalBlock(scope: !84, file: !13, line: 76, column: 5)
!110 = !DILocation(line: 77, column: 17, scope: !109)
!111 = !DILocation(line: 79, column: 18, scope: !109)
!112 = !DILocation(line: 79, column: 31, scope: !109)
!113 = !DILocation(line: 79, column: 24, scope: !109)
!114 = !DILocation(line: 79, column: 45, scope: !109)
!115 = !DILocation(line: 79, column: 9, scope: !109)
!116 = !DILocation(line: 80, column: 20, scope: !109)
!117 = !DILocation(line: 80, column: 9, scope: !109)
!118 = !DILocation(line: 81, column: 14, scope: !109)
!119 = !DILocation(line: 81, column: 9, scope: !109)
!120 = !DILocation(line: 83, column: 1, scope: !84)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !13, line: 88, type: !6)
!123 = !DILocation(line: 88, column: 15, scope: !121)
!124 = !DILocation(line: 89, column: 23, scope: !121)
!125 = !DILocation(line: 89, column: 12, scope: !121)
!126 = !DILocation(line: 89, column: 10, scope: !121)
!127 = !DILocation(line: 90, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !13, line: 90, column: 9)
!129 = !DILocation(line: 90, column: 14, scope: !128)
!130 = !DILocation(line: 90, column: 9, scope: !121)
!131 = !DILocation(line: 90, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !13, line: 90, column: 23)
!133 = !DILocation(line: 91, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !121, file: !13, line: 91, column: 8)
!135 = !DILocation(line: 91, column: 18, scope: !134)
!136 = !DILocation(line: 91, column: 8, scope: !121)
!137 = !DILocation(line: 94, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !13, line: 92, column: 5)
!139 = !DILocation(line: 94, column: 9, scope: !138)
!140 = !DILocation(line: 95, column: 9, scope: !138)
!141 = !DILocation(line: 95, column: 20, scope: !138)
!142 = !DILocation(line: 96, column: 5, scope: !138)
!143 = !DILocalVariable(name: "dest", scope: !144, file: !13, line: 98, type: !46)
!144 = distinct !DILexicalBlock(scope: !121, file: !13, line: 97, column: 5)
!145 = !DILocation(line: 98, column: 17, scope: !144)
!146 = !DILocation(line: 100, column: 18, scope: !144)
!147 = !DILocation(line: 100, column: 31, scope: !144)
!148 = !DILocation(line: 100, column: 24, scope: !144)
!149 = !DILocation(line: 100, column: 45, scope: !144)
!150 = !DILocation(line: 100, column: 9, scope: !144)
!151 = !DILocation(line: 101, column: 20, scope: !144)
!152 = !DILocation(line: 101, column: 9, scope: !144)
!153 = !DILocation(line: 102, column: 14, scope: !144)
!154 = !DILocation(line: 102, column: 9, scope: !144)
!155 = !DILocation(line: 104, column: 1, scope: !121)
