; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_02_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !50
  %arrayidx3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %call5 = call i32* @wcscpy(i32* %arraydecay4, i32* %5) #5, !dbg !55
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay6), !dbg !57
  ret void, !dbg !58
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
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_02_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_02_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_02_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %dataBuffer, align 8, !dbg !91
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !101
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %4, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !110
  %arrayidx3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !111
  store i32 0, i32* %arrayidx3, align 4, !dbg !112
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  %call5 = call i32* @wcscpy(i32* %arraydecay4, i32* %5) #5, !dbg !115
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !116
  call void @printWLine(i32* %arraydecay6), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32* null, i32** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !127
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !128
  %0 = bitcast i8* %call to i32*, !dbg !129
  store i32* %0, i32** %dataBuffer, align 8, !dbg !127
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %cmp = icmp eq i32* %1, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !137
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !140
  store i32* %4, i32** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !146
  %arrayidx3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !147
  store i32 0, i32* %arrayidx3, align 4, !dbg !148
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !149
  %5 = load i32*, i32** %data, align 8, !dbg !150
  %call5 = call i32* @wcscpy(i32* %arraydecay4, i32* %5) #5, !dbg !151
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !152
  call void @printWLine(i32* %arraydecay6), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_02_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 30, type: !4)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 29, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 28, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!27 = !DILocation(line: 30, column: 23, scope: !24)
!28 = !DILocation(line: 30, column: 47, scope: !24)
!29 = !DILocation(line: 30, column: 36, scope: !24)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 31, column: 17)
!32 = !DILocation(line: 31, column: 28, scope: !31)
!33 = !DILocation(line: 31, column: 17, scope: !24)
!34 = !DILocation(line: 31, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 37)
!36 = !DILocation(line: 32, column: 21, scope: !24)
!37 = !DILocation(line: 32, column: 13, scope: !24)
!38 = !DILocation(line: 33, column: 13, scope: !24)
!39 = !DILocation(line: 33, column: 31, scope: !24)
!40 = !DILocation(line: 35, column: 20, scope: !24)
!41 = !DILocation(line: 35, column: 31, scope: !24)
!42 = !DILocation(line: 35, column: 18, scope: !24)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !17, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 200)
!48 = !DILocation(line: 39, column: 17, scope: !44)
!49 = !DILocation(line: 40, column: 17, scope: !44)
!50 = !DILocation(line: 40, column: 9, scope: !44)
!51 = !DILocation(line: 41, column: 9, scope: !44)
!52 = !DILocation(line: 41, column: 23, scope: !44)
!53 = !DILocation(line: 43, column: 16, scope: !44)
!54 = !DILocation(line: 43, column: 22, scope: !44)
!55 = !DILocation(line: 43, column: 9, scope: !44)
!56 = !DILocation(line: 44, column: 20, scope: !44)
!57 = !DILocation(line: 44, column: 9, scope: !44)
!58 = !DILocation(line: 48, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_02_good", scope: !17, file: !17, line: 115, type: !18, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 117, column: 5, scope: !59)
!61 = !DILocation(line: 118, column: 5, scope: !59)
!62 = !DILocation(line: 119, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 131, type: !64, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 131, type: !7)
!70 = !DILocation(line: 131, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 131, type: !66)
!72 = !DILocation(line: 131, column: 27, scope: !63)
!73 = !DILocation(line: 134, column: 22, scope: !63)
!74 = !DILocation(line: 134, column: 12, scope: !63)
!75 = !DILocation(line: 134, column: 5, scope: !63)
!76 = !DILocation(line: 136, column: 5, scope: !63)
!77 = !DILocation(line: 137, column: 5, scope: !63)
!78 = !DILocation(line: 138, column: 5, scope: !63)
!79 = !DILocation(line: 141, column: 5, scope: !63)
!80 = !DILocation(line: 142, column: 5, scope: !63)
!81 = !DILocation(line: 143, column: 5, scope: !63)
!82 = !DILocation(line: 145, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 57, type: !4)
!85 = !DILocation(line: 57, column: 15, scope: !83)
!86 = !DILocation(line: 58, column: 10, scope: !83)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !17, line: 67, type: !4)
!88 = distinct !DILexicalBlock(scope: !89, file: !17, line: 66, column: 9)
!89 = distinct !DILexicalBlock(scope: !90, file: !17, line: 65, column: 5)
!90 = distinct !DILexicalBlock(scope: !83, file: !17, line: 59, column: 8)
!91 = !DILocation(line: 67, column: 23, scope: !88)
!92 = !DILocation(line: 67, column: 47, scope: !88)
!93 = !DILocation(line: 67, column: 36, scope: !88)
!94 = !DILocation(line: 68, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !17, line: 68, column: 17)
!96 = !DILocation(line: 68, column: 28, scope: !95)
!97 = !DILocation(line: 68, column: 17, scope: !88)
!98 = !DILocation(line: 68, column: 38, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 68, column: 37)
!100 = !DILocation(line: 69, column: 21, scope: !88)
!101 = !DILocation(line: 69, column: 13, scope: !88)
!102 = !DILocation(line: 70, column: 13, scope: !88)
!103 = !DILocation(line: 70, column: 31, scope: !88)
!104 = !DILocation(line: 72, column: 20, scope: !88)
!105 = !DILocation(line: 72, column: 18, scope: !88)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !17, line: 76, type: !45)
!107 = distinct !DILexicalBlock(scope: !83, file: !17, line: 75, column: 5)
!108 = !DILocation(line: 76, column: 17, scope: !107)
!109 = !DILocation(line: 77, column: 17, scope: !107)
!110 = !DILocation(line: 77, column: 9, scope: !107)
!111 = !DILocation(line: 78, column: 9, scope: !107)
!112 = !DILocation(line: 78, column: 23, scope: !107)
!113 = !DILocation(line: 80, column: 16, scope: !107)
!114 = !DILocation(line: 80, column: 22, scope: !107)
!115 = !DILocation(line: 80, column: 9, scope: !107)
!116 = !DILocation(line: 81, column: 20, scope: !107)
!117 = !DILocation(line: 81, column: 9, scope: !107)
!118 = !DILocation(line: 85, column: 1, scope: !83)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !17, line: 90, type: !4)
!121 = !DILocation(line: 90, column: 15, scope: !119)
!122 = !DILocation(line: 91, column: 10, scope: !119)
!123 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !17, line: 95, type: !4)
!124 = distinct !DILexicalBlock(scope: !125, file: !17, line: 94, column: 9)
!125 = distinct !DILexicalBlock(scope: !126, file: !17, line: 93, column: 5)
!126 = distinct !DILexicalBlock(scope: !119, file: !17, line: 92, column: 8)
!127 = !DILocation(line: 95, column: 23, scope: !124)
!128 = !DILocation(line: 95, column: 47, scope: !124)
!129 = !DILocation(line: 95, column: 36, scope: !124)
!130 = !DILocation(line: 96, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !17, line: 96, column: 17)
!132 = !DILocation(line: 96, column: 28, scope: !131)
!133 = !DILocation(line: 96, column: 17, scope: !124)
!134 = !DILocation(line: 96, column: 38, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !17, line: 96, column: 37)
!136 = !DILocation(line: 97, column: 21, scope: !124)
!137 = !DILocation(line: 97, column: 13, scope: !124)
!138 = !DILocation(line: 98, column: 13, scope: !124)
!139 = !DILocation(line: 98, column: 31, scope: !124)
!140 = !DILocation(line: 100, column: 20, scope: !124)
!141 = !DILocation(line: 100, column: 18, scope: !124)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !17, line: 104, type: !45)
!143 = distinct !DILexicalBlock(scope: !119, file: !17, line: 103, column: 5)
!144 = !DILocation(line: 104, column: 17, scope: !143)
!145 = !DILocation(line: 105, column: 17, scope: !143)
!146 = !DILocation(line: 105, column: 9, scope: !143)
!147 = !DILocation(line: 106, column: 9, scope: !143)
!148 = !DILocation(line: 106, column: 23, scope: !143)
!149 = !DILocation(line: 108, column: 16, scope: !143)
!150 = !DILocation(line: 108, column: 22, scope: !143)
!151 = !DILocation(line: 108, column: 9, scope: !143)
!152 = !DILocation(line: 109, column: 20, scope: !143)
!153 = !DILocation(line: 109, column: 9, scope: !143)
!154 = !DILocation(line: 113, column: 1, scope: !119)
