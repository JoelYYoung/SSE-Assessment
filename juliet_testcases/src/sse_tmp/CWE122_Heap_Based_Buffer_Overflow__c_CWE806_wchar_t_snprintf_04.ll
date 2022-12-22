; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %7), !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  %9 = bitcast i32* %8 to i8*, !dbg !50
  call void @free(i8* %9) #7, !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !80
  %0 = bitcast i8* %call to i32*, !dbg !81
  store i32* %0, i32** %data, align 8, !dbg !82
  %1 = load i32*, i32** %data, align 8, !dbg !83
  %cmp = icmp eq i32* %1, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !89
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %7), !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %9 = bitcast i32* %8 to i8*, !dbg !105
  call void @free(i8* %9) #7, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !111
  %0 = bitcast i8* %call to i32*, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %cmp = icmp eq i32* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !123
  %3 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !131
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %7), !dbg !135
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %9 = bitcast i32* %8 to i8*, !dbg !136
  call void @free(i8* %9) #7, !dbg !137
  ret void, !dbg !138
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !4)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 23, scope: !16)
!23 = !DILocation(line: 39, column: 12, scope: !16)
!24 = !DILocation(line: 39, column: 10, scope: !16)
!25 = !DILocation(line: 40, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 9)
!27 = !DILocation(line: 40, column: 14, scope: !26)
!28 = !DILocation(line: 40, column: 9, scope: !16)
!29 = !DILocation(line: 40, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 40, column: 23)
!31 = !DILocation(line: 44, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !17, line: 42, column: 5)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!34 = !DILocation(line: 44, column: 9, scope: !32)
!35 = !DILocation(line: 45, column: 9, scope: !32)
!36 = !DILocation(line: 45, column: 21, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !17, line: 48, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 47, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 48, column: 17, scope: !38)
!43 = !DILocation(line: 50, column: 18, scope: !38)
!44 = !DILocation(line: 50, column: 31, scope: !38)
!45 = !DILocation(line: 50, column: 24, scope: !38)
!46 = !DILocation(line: 50, column: 45, scope: !38)
!47 = !DILocation(line: 50, column: 9, scope: !38)
!48 = !DILocation(line: 51, column: 20, scope: !38)
!49 = !DILocation(line: 51, column: 9, scope: !38)
!50 = !DILocation(line: 52, column: 14, scope: !38)
!51 = !DILocation(line: 52, column: 9, scope: !38)
!52 = !DILocation(line: 54, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_04_good", scope: !17, file: !17, line: 107, type: !18, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 109, column: 5, scope: !53)
!55 = !DILocation(line: 110, column: 5, scope: !53)
!56 = !DILocation(line: 111, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 123, type: !58, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !17, line: 123, type: !7)
!64 = !DILocation(line: 123, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !17, line: 123, type: !60)
!66 = !DILocation(line: 123, column: 27, scope: !57)
!67 = !DILocation(line: 126, column: 22, scope: !57)
!68 = !DILocation(line: 126, column: 12, scope: !57)
!69 = !DILocation(line: 126, column: 5, scope: !57)
!70 = !DILocation(line: 128, column: 5, scope: !57)
!71 = !DILocation(line: 129, column: 5, scope: !57)
!72 = !DILocation(line: 130, column: 5, scope: !57)
!73 = !DILocation(line: 133, column: 5, scope: !57)
!74 = !DILocation(line: 134, column: 5, scope: !57)
!75 = !DILocation(line: 135, column: 5, scope: !57)
!76 = !DILocation(line: 137, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !17, line: 63, type: !4)
!79 = !DILocation(line: 63, column: 15, scope: !77)
!80 = !DILocation(line: 64, column: 23, scope: !77)
!81 = !DILocation(line: 64, column: 12, scope: !77)
!82 = !DILocation(line: 64, column: 10, scope: !77)
!83 = !DILocation(line: 65, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !17, line: 65, column: 9)
!85 = !DILocation(line: 65, column: 14, scope: !84)
!86 = !DILocation(line: 65, column: 9, scope: !77)
!87 = !DILocation(line: 65, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !17, line: 65, column: 23)
!89 = !DILocation(line: 74, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !17, line: 72, column: 5)
!91 = distinct !DILexicalBlock(scope: !77, file: !17, line: 66, column: 8)
!92 = !DILocation(line: 74, column: 9, scope: !90)
!93 = !DILocation(line: 75, column: 9, scope: !90)
!94 = !DILocation(line: 75, column: 20, scope: !90)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !17, line: 78, type: !39)
!96 = distinct !DILexicalBlock(scope: !77, file: !17, line: 77, column: 5)
!97 = !DILocation(line: 78, column: 17, scope: !96)
!98 = !DILocation(line: 80, column: 18, scope: !96)
!99 = !DILocation(line: 80, column: 31, scope: !96)
!100 = !DILocation(line: 80, column: 24, scope: !96)
!101 = !DILocation(line: 80, column: 45, scope: !96)
!102 = !DILocation(line: 80, column: 9, scope: !96)
!103 = !DILocation(line: 81, column: 20, scope: !96)
!104 = !DILocation(line: 81, column: 9, scope: !96)
!105 = !DILocation(line: 82, column: 14, scope: !96)
!106 = !DILocation(line: 82, column: 9, scope: !96)
!107 = !DILocation(line: 84, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 87, type: !18, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 89, type: !4)
!110 = !DILocation(line: 89, column: 15, scope: !108)
!111 = !DILocation(line: 90, column: 23, scope: !108)
!112 = !DILocation(line: 90, column: 12, scope: !108)
!113 = !DILocation(line: 90, column: 10, scope: !108)
!114 = !DILocation(line: 91, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !17, line: 91, column: 9)
!116 = !DILocation(line: 91, column: 14, scope: !115)
!117 = !DILocation(line: 91, column: 9, scope: !108)
!118 = !DILocation(line: 91, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 91, column: 23)
!120 = !DILocation(line: 95, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !122, file: !17, line: 93, column: 5)
!122 = distinct !DILexicalBlock(scope: !108, file: !17, line: 92, column: 8)
!123 = !DILocation(line: 95, column: 9, scope: !121)
!124 = !DILocation(line: 96, column: 9, scope: !121)
!125 = !DILocation(line: 96, column: 20, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !17, line: 99, type: !39)
!127 = distinct !DILexicalBlock(scope: !108, file: !17, line: 98, column: 5)
!128 = !DILocation(line: 99, column: 17, scope: !127)
!129 = !DILocation(line: 101, column: 18, scope: !127)
!130 = !DILocation(line: 101, column: 31, scope: !127)
!131 = !DILocation(line: 101, column: 24, scope: !127)
!132 = !DILocation(line: 101, column: 45, scope: !127)
!133 = !DILocation(line: 101, column: 9, scope: !127)
!134 = !DILocation(line: 102, column: 20, scope: !127)
!135 = !DILocation(line: 102, column: 9, scope: !127)
!136 = !DILocation(line: 103, column: 14, scope: !127)
!137 = !DILocation(line: 103, column: 9, scope: !127)
!138 = !DILocation(line: 105, column: 1, scope: !108)
