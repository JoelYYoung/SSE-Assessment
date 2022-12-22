; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12_bad() #0 !dbg !16 {
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
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.else, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end6, !dbg !39

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !40
  %call4 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !43
  store i32 0, i32* %arrayidx5, align 4, !dbg !44
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %call7 = call i64 @wcslen(i32* %8) #9, !dbg !54
  %call8 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call7) #7, !dbg !55
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !56
  store i32 0, i32* %arrayidx9, align 4, !dbg !57
  %9 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %9), !dbg !59
  %10 = load i32*, i32** %data, align 8, !dbg !60
  %11 = bitcast i32* %10 to i8*, !dbg !60
  call void @free(i8* %11) #7, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrueOrFalse(...) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !98
  %tobool = icmp ne i32 %call1, 0, !dbg !98
  br i1 %tobool, label %if.then2, label %if.else, !dbg !100

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %if.end6, !dbg !106

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !107
  %call4 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !110
  store i32 0, i32* %arrayidx5, align 4, !dbg !111
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !115
  %7 = load i32*, i32** %data, align 8, !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  %call7 = call i64 @wcslen(i32* %8) #9, !dbg !118
  %call8 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call7) #7, !dbg !119
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !120
  store i32 0, i32* %arrayidx9, align 4, !dbg !121
  %9 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* %9), !dbg !123
  %10 = load i32*, i32** %data, align 8, !dbg !124
  %11 = bitcast i32* %10 to i8*, !dbg !124
  call void @free(i8* %11) #7, !dbg !125
  ret void, !dbg !126
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !16)
!34 = !DILocation(line: 31, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 29, column: 5)
!36 = !DILocation(line: 31, column: 9, scope: !35)
!37 = !DILocation(line: 32, column: 9, scope: !35)
!38 = !DILocation(line: 32, column: 21, scope: !35)
!39 = !DILocation(line: 33, column: 5, scope: !35)
!40 = !DILocation(line: 37, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !17, line: 35, column: 5)
!42 = !DILocation(line: 37, column: 9, scope: !41)
!43 = !DILocation(line: 38, column: 9, scope: !41)
!44 = !DILocation(line: 38, column: 20, scope: !41)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !17, line: 41, type: !47)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 41, column: 17, scope: !46)
!51 = !DILocation(line: 43, column: 17, scope: !46)
!52 = !DILocation(line: 43, column: 23, scope: !46)
!53 = !DILocation(line: 43, column: 36, scope: !46)
!54 = !DILocation(line: 43, column: 29, scope: !46)
!55 = !DILocation(line: 43, column: 9, scope: !46)
!56 = !DILocation(line: 44, column: 9, scope: !46)
!57 = !DILocation(line: 44, column: 20, scope: !46)
!58 = !DILocation(line: 45, column: 20, scope: !46)
!59 = !DILocation(line: 45, column: 9, scope: !46)
!60 = !DILocation(line: 46, column: 14, scope: !46)
!61 = !DILocation(line: 46, column: 9, scope: !46)
!62 = !DILocation(line: 48, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_12_good", scope: !17, file: !17, line: 83, type: !18, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 85, column: 5, scope: !63)
!65 = !DILocation(line: 86, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 98, type: !67, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 98, type: !7)
!73 = !DILocation(line: 98, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 98, type: !69)
!75 = !DILocation(line: 98, column: 27, scope: !66)
!76 = !DILocation(line: 101, column: 22, scope: !66)
!77 = !DILocation(line: 101, column: 12, scope: !66)
!78 = !DILocation(line: 101, column: 5, scope: !66)
!79 = !DILocation(line: 103, column: 5, scope: !66)
!80 = !DILocation(line: 104, column: 5, scope: !66)
!81 = !DILocation(line: 105, column: 5, scope: !66)
!82 = !DILocation(line: 108, column: 5, scope: !66)
!83 = !DILocation(line: 109, column: 5, scope: !66)
!84 = !DILocation(line: 110, column: 5, scope: !66)
!85 = !DILocation(line: 112, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 58, type: !4)
!88 = !DILocation(line: 58, column: 15, scope: !86)
!89 = !DILocation(line: 59, column: 23, scope: !86)
!90 = !DILocation(line: 59, column: 12, scope: !86)
!91 = !DILocation(line: 59, column: 10, scope: !86)
!92 = !DILocation(line: 60, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !17, line: 60, column: 9)
!94 = !DILocation(line: 60, column: 14, scope: !93)
!95 = !DILocation(line: 60, column: 9, scope: !86)
!96 = !DILocation(line: 60, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 60, column: 23)
!98 = !DILocation(line: 61, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !17, line: 61, column: 8)
!100 = !DILocation(line: 61, column: 8, scope: !86)
!101 = !DILocation(line: 64, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !17, line: 62, column: 5)
!103 = !DILocation(line: 64, column: 9, scope: !102)
!104 = !DILocation(line: 65, column: 9, scope: !102)
!105 = !DILocation(line: 65, column: 20, scope: !102)
!106 = !DILocation(line: 66, column: 5, scope: !102)
!107 = !DILocation(line: 70, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !99, file: !17, line: 68, column: 5)
!109 = !DILocation(line: 70, column: 9, scope: !108)
!110 = !DILocation(line: 71, column: 9, scope: !108)
!111 = !DILocation(line: 71, column: 20, scope: !108)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !17, line: 74, type: !47)
!113 = distinct !DILexicalBlock(scope: !86, file: !17, line: 73, column: 5)
!114 = !DILocation(line: 74, column: 17, scope: !113)
!115 = !DILocation(line: 76, column: 17, scope: !113)
!116 = !DILocation(line: 76, column: 23, scope: !113)
!117 = !DILocation(line: 76, column: 36, scope: !113)
!118 = !DILocation(line: 76, column: 29, scope: !113)
!119 = !DILocation(line: 76, column: 9, scope: !113)
!120 = !DILocation(line: 77, column: 9, scope: !113)
!121 = !DILocation(line: 77, column: 20, scope: !113)
!122 = !DILocation(line: 78, column: 20, scope: !113)
!123 = !DILocation(line: 78, column: 9, scope: !113)
!124 = !DILocation(line: 79, column: 14, scope: !113)
!125 = !DILocation(line: 79, column: 9, scope: !113)
!126 = !DILocation(line: 81, column: 1, scope: !86)
