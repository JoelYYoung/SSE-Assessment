; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %dataBuffer, align 8, !dbg !32
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !42
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !46
  store i32* %add.ptr, i32** %data, align 8, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !49
  store i32* %5, i32** %unionFirst, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !54
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !54
  store i32* %6, i32** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx4, align 4, !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %7 = load i32*, i32** %data2, align 8, !dbg !66
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !68
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %7, i64 %call7) #6, !dbg !69
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !70
  store i32 0, i32* %arrayidx9, align 4, !dbg !71
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  call void @printWLine(i32* %arraydecay10), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType* %myUnion, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %dataBuffer, align 8, !dbg !106
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !116
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  store i32* %4, i32** %data, align 8, !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !122
  store i32* %5, i32** %unionFirst, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !127
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !127
  store i32* %6, i32** %data2, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !132
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx4, align 4, !dbg !134
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %7 = load i32*, i32** %data2, align 8, !dbg !136
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !138
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %7, i64 %call7) #6, !dbg !139
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !140
  store i32 0, i32* %arrayidx9, align 4, !dbg !141
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  call void @printWLine(i32* %arraydecay10), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 63, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !17, line: 35, type: !4)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!32 = !DILocation(line: 35, column: 19, scope: !31)
!33 = !DILocation(line: 35, column: 43, scope: !31)
!34 = !DILocation(line: 35, column: 32, scope: !31)
!35 = !DILocation(line: 36, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !17, line: 36, column: 13)
!37 = !DILocation(line: 36, column: 24, scope: !36)
!38 = !DILocation(line: 36, column: 13, scope: !31)
!39 = !DILocation(line: 36, column: 34, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !17, line: 36, column: 33)
!41 = !DILocation(line: 37, column: 17, scope: !31)
!42 = !DILocation(line: 37, column: 9, scope: !31)
!43 = !DILocation(line: 38, column: 9, scope: !31)
!44 = !DILocation(line: 38, column: 27, scope: !31)
!45 = !DILocation(line: 40, column: 16, scope: !31)
!46 = !DILocation(line: 40, column: 27, scope: !31)
!47 = !DILocation(line: 40, column: 14, scope: !31)
!48 = !DILocation(line: 42, column: 26, scope: !16)
!49 = !DILocation(line: 42, column: 13, scope: !16)
!50 = !DILocation(line: 42, column: 24, scope: !16)
!51 = !DILocalVariable(name: "data", scope: !52, file: !17, line: 44, type: !4)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!53 = !DILocation(line: 44, column: 19, scope: !52)
!54 = !DILocation(line: 44, column: 34, scope: !52)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !17, line: 46, type: !57)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 45, column: 9)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 46, column: 21, scope: !56)
!61 = !DILocation(line: 47, column: 21, scope: !56)
!62 = !DILocation(line: 47, column: 13, scope: !56)
!63 = !DILocation(line: 48, column: 13, scope: !56)
!64 = !DILocation(line: 48, column: 25, scope: !56)
!65 = !DILocation(line: 50, column: 21, scope: !56)
!66 = !DILocation(line: 50, column: 27, scope: !56)
!67 = !DILocation(line: 50, column: 40, scope: !56)
!68 = !DILocation(line: 50, column: 33, scope: !56)
!69 = !DILocation(line: 50, column: 13, scope: !56)
!70 = !DILocation(line: 52, column: 13, scope: !56)
!71 = !DILocation(line: 52, column: 25, scope: !56)
!72 = !DILocation(line: 53, column: 24, scope: !56)
!73 = !DILocation(line: 53, column: 13, scope: !56)
!74 = !DILocation(line: 58, column: 1, scope: !16)
!75 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_34_good", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 98, column: 5, scope: !75)
!77 = !DILocation(line: 99, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 110, type: !79, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !17, line: 110, type: !7)
!85 = !DILocation(line: 110, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !17, line: 110, type: !81)
!87 = !DILocation(line: 110, column: 27, scope: !78)
!88 = !DILocation(line: 113, column: 22, scope: !78)
!89 = !DILocation(line: 113, column: 12, scope: !78)
!90 = !DILocation(line: 113, column: 5, scope: !78)
!91 = !DILocation(line: 115, column: 5, scope: !78)
!92 = !DILocation(line: 116, column: 5, scope: !78)
!93 = !DILocation(line: 117, column: 5, scope: !78)
!94 = !DILocation(line: 120, column: 5, scope: !78)
!95 = !DILocation(line: 121, column: 5, scope: !78)
!96 = !DILocation(line: 122, column: 5, scope: !78)
!97 = !DILocation(line: 124, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 67, type: !4)
!100 = !DILocation(line: 67, column: 15, scope: !98)
!101 = !DILocalVariable(name: "myUnion", scope: !98, file: !17, line: 68, type: !23)
!102 = !DILocation(line: 68, column: 63, scope: !98)
!103 = !DILocation(line: 69, column: 10, scope: !98)
!104 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !17, line: 71, type: !4)
!105 = distinct !DILexicalBlock(scope: !98, file: !17, line: 70, column: 5)
!106 = !DILocation(line: 71, column: 19, scope: !105)
!107 = !DILocation(line: 71, column: 43, scope: !105)
!108 = !DILocation(line: 71, column: 32, scope: !105)
!109 = !DILocation(line: 72, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 72, column: 13)
!111 = !DILocation(line: 72, column: 24, scope: !110)
!112 = !DILocation(line: 72, column: 13, scope: !105)
!113 = !DILocation(line: 72, column: 34, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 72, column: 33)
!115 = !DILocation(line: 73, column: 17, scope: !105)
!116 = !DILocation(line: 73, column: 9, scope: !105)
!117 = !DILocation(line: 74, column: 9, scope: !105)
!118 = !DILocation(line: 74, column: 27, scope: !105)
!119 = !DILocation(line: 76, column: 16, scope: !105)
!120 = !DILocation(line: 76, column: 14, scope: !105)
!121 = !DILocation(line: 78, column: 26, scope: !98)
!122 = !DILocation(line: 78, column: 13, scope: !98)
!123 = !DILocation(line: 78, column: 24, scope: !98)
!124 = !DILocalVariable(name: "data", scope: !125, file: !17, line: 80, type: !4)
!125 = distinct !DILexicalBlock(scope: !98, file: !17, line: 79, column: 5)
!126 = !DILocation(line: 80, column: 19, scope: !125)
!127 = !DILocation(line: 80, column: 34, scope: !125)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !17, line: 82, type: !57)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 81, column: 9)
!130 = !DILocation(line: 82, column: 21, scope: !129)
!131 = !DILocation(line: 83, column: 21, scope: !129)
!132 = !DILocation(line: 83, column: 13, scope: !129)
!133 = !DILocation(line: 84, column: 13, scope: !129)
!134 = !DILocation(line: 84, column: 25, scope: !129)
!135 = !DILocation(line: 86, column: 21, scope: !129)
!136 = !DILocation(line: 86, column: 27, scope: !129)
!137 = !DILocation(line: 86, column: 40, scope: !129)
!138 = !DILocation(line: 86, column: 33, scope: !129)
!139 = !DILocation(line: 86, column: 13, scope: !129)
!140 = !DILocation(line: 88, column: 13, scope: !129)
!141 = !DILocation(line: 88, column: 25, scope: !129)
!142 = !DILocation(line: 89, column: 24, scope: !129)
!143 = !DILocation(line: 89, column: 13, scope: !129)
!144 = !DILocation(line: 94, column: 1, scope: !98)
