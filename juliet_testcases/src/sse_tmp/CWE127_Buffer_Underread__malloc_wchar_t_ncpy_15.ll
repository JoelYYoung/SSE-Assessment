; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !54
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !55
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx8, align 4, !dbg !57
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay9), !dbg !59
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

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15_good() #0 !dbg !61 {
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
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %dataBuffer, align 8, !dbg !91
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !101
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %4, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !110
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx3, align 4, !dbg !112
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !116
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !117
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx8, align 4, !dbg !119
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  call void @printWLine(i32* %arraydecay9), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32* null, i32** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !129
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !130
  %0 = bitcast i8* %call to i32*, !dbg !131
  store i32* %0, i32** %dataBuffer, align 8, !dbg !129
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %cmp = icmp eq i32* %1, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !139
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !142
  store i32* %4, i32** %data, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !148
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx3, align 4, !dbg !150
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %5 = load i32*, i32** %data, align 8, !dbg !152
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !154
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !155
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx8, align 4, !dbg !157
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  call void @printWLine(i32* %arraydecay9), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 31, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!25 = !DILocation(line: 31, column: 19, scope: !24)
!26 = !DILocation(line: 31, column: 43, scope: !24)
!27 = !DILocation(line: 31, column: 32, scope: !24)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 24, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !24)
!32 = !DILocation(line: 32, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 32, column: 33)
!34 = !DILocation(line: 33, column: 17, scope: !24)
!35 = !DILocation(line: 33, column: 9, scope: !24)
!36 = !DILocation(line: 34, column: 9, scope: !24)
!37 = !DILocation(line: 34, column: 27, scope: !24)
!38 = !DILocation(line: 36, column: 16, scope: !24)
!39 = !DILocation(line: 36, column: 27, scope: !24)
!40 = !DILocation(line: 36, column: 14, scope: !24)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocation(line: 46, column: 17, scope: !42)
!48 = !DILocation(line: 46, column: 9, scope: !42)
!49 = !DILocation(line: 47, column: 9, scope: !42)
!50 = !DILocation(line: 47, column: 21, scope: !42)
!51 = !DILocation(line: 49, column: 17, scope: !42)
!52 = !DILocation(line: 49, column: 23, scope: !42)
!53 = !DILocation(line: 49, column: 36, scope: !42)
!54 = !DILocation(line: 49, column: 29, scope: !42)
!55 = !DILocation(line: 49, column: 9, scope: !42)
!56 = !DILocation(line: 51, column: 9, scope: !42)
!57 = !DILocation(line: 51, column: 21, scope: !42)
!58 = !DILocation(line: 52, column: 20, scope: !42)
!59 = !DILocation(line: 52, column: 9, scope: !42)
!60 = !DILocation(line: 56, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_15_good", scope: !17, file: !17, line: 134, type: !18, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 136, column: 5, scope: !61)
!63 = !DILocation(line: 137, column: 5, scope: !61)
!64 = !DILocation(line: 138, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 150, type: !66, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !17, line: 150, type: !7)
!72 = !DILocation(line: 150, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !17, line: 150, type: !68)
!74 = !DILocation(line: 150, column: 27, scope: !65)
!75 = !DILocation(line: 153, column: 22, scope: !65)
!76 = !DILocation(line: 153, column: 12, scope: !65)
!77 = !DILocation(line: 153, column: 5, scope: !65)
!78 = !DILocation(line: 155, column: 5, scope: !65)
!79 = !DILocation(line: 156, column: 5, scope: !65)
!80 = !DILocation(line: 157, column: 5, scope: !65)
!81 = !DILocation(line: 160, column: 5, scope: !65)
!82 = !DILocation(line: 161, column: 5, scope: !65)
!83 = !DILocation(line: 162, column: 5, scope: !65)
!84 = !DILocation(line: 164, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 65, type: !4)
!87 = !DILocation(line: 65, column: 15, scope: !85)
!88 = !DILocation(line: 66, column: 10, scope: !85)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !17, line: 75, type: !4)
!90 = distinct !DILexicalBlock(scope: !85, file: !17, line: 74, column: 5)
!91 = !DILocation(line: 75, column: 19, scope: !90)
!92 = !DILocation(line: 75, column: 43, scope: !90)
!93 = !DILocation(line: 75, column: 32, scope: !90)
!94 = !DILocation(line: 76, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !17, line: 76, column: 13)
!96 = !DILocation(line: 76, column: 24, scope: !95)
!97 = !DILocation(line: 76, column: 13, scope: !90)
!98 = !DILocation(line: 76, column: 34, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 76, column: 33)
!100 = !DILocation(line: 77, column: 17, scope: !90)
!101 = !DILocation(line: 77, column: 9, scope: !90)
!102 = !DILocation(line: 78, column: 9, scope: !90)
!103 = !DILocation(line: 78, column: 27, scope: !90)
!104 = !DILocation(line: 80, column: 16, scope: !90)
!105 = !DILocation(line: 80, column: 14, scope: !90)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !17, line: 85, type: !43)
!107 = distinct !DILexicalBlock(scope: !85, file: !17, line: 84, column: 5)
!108 = !DILocation(line: 85, column: 17, scope: !107)
!109 = !DILocation(line: 86, column: 17, scope: !107)
!110 = !DILocation(line: 86, column: 9, scope: !107)
!111 = !DILocation(line: 87, column: 9, scope: !107)
!112 = !DILocation(line: 87, column: 21, scope: !107)
!113 = !DILocation(line: 89, column: 17, scope: !107)
!114 = !DILocation(line: 89, column: 23, scope: !107)
!115 = !DILocation(line: 89, column: 36, scope: !107)
!116 = !DILocation(line: 89, column: 29, scope: !107)
!117 = !DILocation(line: 89, column: 9, scope: !107)
!118 = !DILocation(line: 91, column: 9, scope: !107)
!119 = !DILocation(line: 91, column: 21, scope: !107)
!120 = !DILocation(line: 92, column: 20, scope: !107)
!121 = !DILocation(line: 92, column: 9, scope: !107)
!122 = !DILocation(line: 96, column: 1, scope: !85)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 99, type: !18, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 101, type: !4)
!125 = !DILocation(line: 101, column: 15, scope: !123)
!126 = !DILocation(line: 102, column: 10, scope: !123)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !17, line: 107, type: !4)
!128 = distinct !DILexicalBlock(scope: !123, file: !17, line: 106, column: 5)
!129 = !DILocation(line: 107, column: 19, scope: !128)
!130 = !DILocation(line: 107, column: 43, scope: !128)
!131 = !DILocation(line: 107, column: 32, scope: !128)
!132 = !DILocation(line: 108, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !17, line: 108, column: 13)
!134 = !DILocation(line: 108, column: 24, scope: !133)
!135 = !DILocation(line: 108, column: 13, scope: !128)
!136 = !DILocation(line: 108, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 108, column: 33)
!138 = !DILocation(line: 109, column: 17, scope: !128)
!139 = !DILocation(line: 109, column: 9, scope: !128)
!140 = !DILocation(line: 110, column: 9, scope: !128)
!141 = !DILocation(line: 110, column: 27, scope: !128)
!142 = !DILocation(line: 112, column: 16, scope: !128)
!143 = !DILocation(line: 112, column: 14, scope: !128)
!144 = !DILocalVariable(name: "dest", scope: !145, file: !17, line: 121, type: !43)
!145 = distinct !DILexicalBlock(scope: !123, file: !17, line: 120, column: 5)
!146 = !DILocation(line: 121, column: 17, scope: !145)
!147 = !DILocation(line: 122, column: 17, scope: !145)
!148 = !DILocation(line: 122, column: 9, scope: !145)
!149 = !DILocation(line: 123, column: 9, scope: !145)
!150 = !DILocation(line: 123, column: 21, scope: !145)
!151 = !DILocation(line: 125, column: 17, scope: !145)
!152 = !DILocation(line: 125, column: 23, scope: !145)
!153 = !DILocation(line: 125, column: 36, scope: !145)
!154 = !DILocation(line: 125, column: 29, scope: !145)
!155 = !DILocation(line: 125, column: 9, scope: !145)
!156 = !DILocation(line: 127, column: 9, scope: !145)
!157 = !DILocation(line: 127, column: 21, scope: !145)
!158 = !DILocation(line: 128, column: 20, scope: !145)
!159 = !DILocation(line: 128, column: 9, scope: !145)
!160 = !DILocation(line: 132, column: 1, scope: !123)
