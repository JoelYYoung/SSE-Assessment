; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !39
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #6, !dbg !40
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx6, align 4, !dbg !42
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  call void @printWLine(i32* %arraydecay7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !51, metadata !DIExpression()), !dbg !53
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !54
  %0 = bitcast i8* %call to i32*, !dbg !55
  store i32* %0, i32** %dataBuffer, align 8, !dbg !53
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !63
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !67
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !68
  %5 = load i32*, i32** %data.addr, align 8, !dbg !69
  ret i32* %5, !dbg !70
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %call = call i32* @goodG2BSource(i32* %0), !dbg !99
  store i32* %call, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !105
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !111
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #6, !dbg !112
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx6, align 4, !dbg !114
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay7), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !118 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !121, metadata !DIExpression()), !dbg !123
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !124
  %0 = bitcast i8* %call to i32*, !dbg !125
  store i32* %0, i32** %dataBuffer, align 8, !dbg !123
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %cmp = icmp eq i32* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !133
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  store i32* %4, i32** %data.addr, align 8, !dbg !137
  %5 = load i32*, i32** %data.addr, align 8, !dbg !138
  ret i32* %5, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "dest", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocation(line: 43, column: 17, scope: !27)
!33 = !DILocation(line: 43, column: 9, scope: !27)
!34 = !DILocation(line: 44, column: 9, scope: !27)
!35 = !DILocation(line: 44, column: 21, scope: !27)
!36 = !DILocation(line: 46, column: 17, scope: !27)
!37 = !DILocation(line: 46, column: 23, scope: !27)
!38 = !DILocation(line: 46, column: 36, scope: !27)
!39 = !DILocation(line: 46, column: 29, scope: !27)
!40 = !DILocation(line: 46, column: 9, scope: !27)
!41 = !DILocation(line: 48, column: 9, scope: !27)
!42 = !DILocation(line: 48, column: 21, scope: !27)
!43 = !DILocation(line: 49, column: 20, scope: !27)
!44 = !DILocation(line: 49, column: 9, scope: !27)
!45 = !DILocation(line: 53, column: 1, scope: !16)
!46 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !47, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!5, !5}
!49 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !17, line: 23, type: !5)
!50 = !DILocation(line: 23, column: 38, scope: !46)
!51 = !DILocalVariable(name: "dataBuffer", scope: !52, file: !17, line: 26, type: !5)
!52 = distinct !DILexicalBlock(scope: !46, file: !17, line: 25, column: 5)
!53 = !DILocation(line: 26, column: 19, scope: !52)
!54 = !DILocation(line: 26, column: 43, scope: !52)
!55 = !DILocation(line: 26, column: 32, scope: !52)
!56 = !DILocation(line: 27, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !17, line: 27, column: 13)
!58 = !DILocation(line: 27, column: 24, scope: !57)
!59 = !DILocation(line: 27, column: 13, scope: !52)
!60 = !DILocation(line: 27, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !17, line: 27, column: 33)
!62 = !DILocation(line: 28, column: 17, scope: !52)
!63 = !DILocation(line: 28, column: 9, scope: !52)
!64 = !DILocation(line: 29, column: 9, scope: !52)
!65 = !DILocation(line: 29, column: 27, scope: !52)
!66 = !DILocation(line: 31, column: 16, scope: !52)
!67 = !DILocation(line: 31, column: 27, scope: !52)
!68 = !DILocation(line: 31, column: 14, scope: !52)
!69 = !DILocation(line: 33, column: 12, scope: !46)
!70 = !DILocation(line: 33, column: 5, scope: !46)
!71 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_42_good", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 94, column: 5, scope: !71)
!73 = !DILocation(line: 95, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 107, type: !75, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!8, !8, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !17, line: 107, type: !8)
!81 = !DILocation(line: 107, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !17, line: 107, type: !77)
!83 = !DILocation(line: 107, column: 27, scope: !74)
!84 = !DILocation(line: 110, column: 22, scope: !74)
!85 = !DILocation(line: 110, column: 12, scope: !74)
!86 = !DILocation(line: 110, column: 5, scope: !74)
!87 = !DILocation(line: 112, column: 5, scope: !74)
!88 = !DILocation(line: 113, column: 5, scope: !74)
!89 = !DILocation(line: 114, column: 5, scope: !74)
!90 = !DILocation(line: 117, column: 5, scope: !74)
!91 = !DILocation(line: 118, column: 5, scope: !74)
!92 = !DILocation(line: 119, column: 5, scope: !74)
!93 = !DILocation(line: 121, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !17, line: 75, type: !5)
!96 = !DILocation(line: 75, column: 15, scope: !94)
!97 = !DILocation(line: 76, column: 10, scope: !94)
!98 = !DILocation(line: 77, column: 26, scope: !94)
!99 = !DILocation(line: 77, column: 12, scope: !94)
!100 = !DILocation(line: 77, column: 10, scope: !94)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !17, line: 79, type: !28)
!102 = distinct !DILexicalBlock(scope: !94, file: !17, line: 78, column: 5)
!103 = !DILocation(line: 79, column: 17, scope: !102)
!104 = !DILocation(line: 80, column: 17, scope: !102)
!105 = !DILocation(line: 80, column: 9, scope: !102)
!106 = !DILocation(line: 81, column: 9, scope: !102)
!107 = !DILocation(line: 81, column: 21, scope: !102)
!108 = !DILocation(line: 83, column: 17, scope: !102)
!109 = !DILocation(line: 83, column: 23, scope: !102)
!110 = !DILocation(line: 83, column: 36, scope: !102)
!111 = !DILocation(line: 83, column: 29, scope: !102)
!112 = !DILocation(line: 83, column: 9, scope: !102)
!113 = !DILocation(line: 85, column: 9, scope: !102)
!114 = !DILocation(line: 85, column: 21, scope: !102)
!115 = !DILocation(line: 86, column: 20, scope: !102)
!116 = !DILocation(line: 86, column: 9, scope: !102)
!117 = !DILocation(line: 90, column: 1, scope: !94)
!118 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 59, type: !47, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", arg: 1, scope: !118, file: !17, line: 59, type: !5)
!120 = !DILocation(line: 59, column: 42, scope: !118)
!121 = !DILocalVariable(name: "dataBuffer", scope: !122, file: !17, line: 62, type: !5)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 61, column: 5)
!123 = !DILocation(line: 62, column: 19, scope: !122)
!124 = !DILocation(line: 62, column: 43, scope: !122)
!125 = !DILocation(line: 62, column: 32, scope: !122)
!126 = !DILocation(line: 63, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !17, line: 63, column: 13)
!128 = !DILocation(line: 63, column: 24, scope: !127)
!129 = !DILocation(line: 63, column: 13, scope: !122)
!130 = !DILocation(line: 63, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 63, column: 33)
!132 = !DILocation(line: 64, column: 17, scope: !122)
!133 = !DILocation(line: 64, column: 9, scope: !122)
!134 = !DILocation(line: 65, column: 9, scope: !122)
!135 = !DILocation(line: 65, column: 27, scope: !122)
!136 = !DILocation(line: 67, column: 16, scope: !122)
!137 = !DILocation(line: 67, column: 14, scope: !122)
!138 = !DILocation(line: 69, column: 12, scope: !118)
!139 = !DILocation(line: 69, column: 5, scope: !118)
