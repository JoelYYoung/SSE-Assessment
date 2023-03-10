; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !56
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !57
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx8, align 4, !dbg !59
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay9), !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !97
  store i32* %0, i32** %dataBuffer, align 8, !dbg !95
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !105
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %4, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !114
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx3, align 4, !dbg !116
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !120
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !121
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx8, align 4, !dbg !123
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* %arraydecay9), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i32* null, i32** %data, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !131, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !136
  %0 = bitcast i8* %call to i32*, !dbg !137
  store i32* %0, i32** %dataBuffer, align 8, !dbg !135
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  %cmp = icmp eq i32* %1, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !145
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  store i32* %4, i32** %data, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !150, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !154
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx3, align 4, !dbg !156
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  %5 = load i32*, i32** %data, align 8, !dbg !158
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !160
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !161
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx8, align 4, !dbg !163
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  call void @printWLine(i32* %arraydecay9), !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 39, column: 17, scope: !44)
!49 = !DILocation(line: 40, column: 17, scope: !44)
!50 = !DILocation(line: 40, column: 9, scope: !44)
!51 = !DILocation(line: 41, column: 9, scope: !44)
!52 = !DILocation(line: 41, column: 21, scope: !44)
!53 = !DILocation(line: 43, column: 17, scope: !44)
!54 = !DILocation(line: 43, column: 23, scope: !44)
!55 = !DILocation(line: 43, column: 36, scope: !44)
!56 = !DILocation(line: 43, column: 29, scope: !44)
!57 = !DILocation(line: 43, column: 9, scope: !44)
!58 = !DILocation(line: 45, column: 9, scope: !44)
!59 = !DILocation(line: 45, column: 21, scope: !44)
!60 = !DILocation(line: 46, column: 20, scope: !44)
!61 = !DILocation(line: 46, column: 9, scope: !44)
!62 = !DILocation(line: 50, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_02_good", scope: !17, file: !17, line: 121, type: !18, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 123, column: 5, scope: !63)
!65 = !DILocation(line: 124, column: 5, scope: !63)
!66 = !DILocation(line: 125, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 137, type: !68, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 137, type: !7)
!74 = !DILocation(line: 137, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 137, type: !70)
!76 = !DILocation(line: 137, column: 27, scope: !67)
!77 = !DILocation(line: 140, column: 22, scope: !67)
!78 = !DILocation(line: 140, column: 12, scope: !67)
!79 = !DILocation(line: 140, column: 5, scope: !67)
!80 = !DILocation(line: 142, column: 5, scope: !67)
!81 = !DILocation(line: 143, column: 5, scope: !67)
!82 = !DILocation(line: 144, column: 5, scope: !67)
!83 = !DILocation(line: 147, column: 5, scope: !67)
!84 = !DILocation(line: 148, column: 5, scope: !67)
!85 = !DILocation(line: 149, column: 5, scope: !67)
!86 = !DILocation(line: 151, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 59, type: !4)
!89 = !DILocation(line: 59, column: 15, scope: !87)
!90 = !DILocation(line: 60, column: 10, scope: !87)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !17, line: 69, type: !4)
!92 = distinct !DILexicalBlock(scope: !93, file: !17, line: 68, column: 9)
!93 = distinct !DILexicalBlock(scope: !94, file: !17, line: 67, column: 5)
!94 = distinct !DILexicalBlock(scope: !87, file: !17, line: 61, column: 8)
!95 = !DILocation(line: 69, column: 23, scope: !92)
!96 = !DILocation(line: 69, column: 47, scope: !92)
!97 = !DILocation(line: 69, column: 36, scope: !92)
!98 = !DILocation(line: 70, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !17, line: 70, column: 17)
!100 = !DILocation(line: 70, column: 28, scope: !99)
!101 = !DILocation(line: 70, column: 17, scope: !92)
!102 = !DILocation(line: 70, column: 38, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 70, column: 37)
!104 = !DILocation(line: 71, column: 21, scope: !92)
!105 = !DILocation(line: 71, column: 13, scope: !92)
!106 = !DILocation(line: 72, column: 13, scope: !92)
!107 = !DILocation(line: 72, column: 31, scope: !92)
!108 = !DILocation(line: 74, column: 20, scope: !92)
!109 = !DILocation(line: 74, column: 18, scope: !92)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !17, line: 78, type: !45)
!111 = distinct !DILexicalBlock(scope: !87, file: !17, line: 77, column: 5)
!112 = !DILocation(line: 78, column: 17, scope: !111)
!113 = !DILocation(line: 79, column: 17, scope: !111)
!114 = !DILocation(line: 79, column: 9, scope: !111)
!115 = !DILocation(line: 80, column: 9, scope: !111)
!116 = !DILocation(line: 80, column: 21, scope: !111)
!117 = !DILocation(line: 82, column: 17, scope: !111)
!118 = !DILocation(line: 82, column: 23, scope: !111)
!119 = !DILocation(line: 82, column: 36, scope: !111)
!120 = !DILocation(line: 82, column: 29, scope: !111)
!121 = !DILocation(line: 82, column: 9, scope: !111)
!122 = !DILocation(line: 84, column: 9, scope: !111)
!123 = !DILocation(line: 84, column: 21, scope: !111)
!124 = !DILocation(line: 85, column: 20, scope: !111)
!125 = !DILocation(line: 85, column: 9, scope: !111)
!126 = !DILocation(line: 89, column: 1, scope: !87)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", scope: !127, file: !17, line: 94, type: !4)
!129 = !DILocation(line: 94, column: 15, scope: !127)
!130 = !DILocation(line: 95, column: 10, scope: !127)
!131 = !DILocalVariable(name: "dataBuffer", scope: !132, file: !17, line: 99, type: !4)
!132 = distinct !DILexicalBlock(scope: !133, file: !17, line: 98, column: 9)
!133 = distinct !DILexicalBlock(scope: !134, file: !17, line: 97, column: 5)
!134 = distinct !DILexicalBlock(scope: !127, file: !17, line: 96, column: 8)
!135 = !DILocation(line: 99, column: 23, scope: !132)
!136 = !DILocation(line: 99, column: 47, scope: !132)
!137 = !DILocation(line: 99, column: 36, scope: !132)
!138 = !DILocation(line: 100, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !17, line: 100, column: 17)
!140 = !DILocation(line: 100, column: 28, scope: !139)
!141 = !DILocation(line: 100, column: 17, scope: !132)
!142 = !DILocation(line: 100, column: 38, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !17, line: 100, column: 37)
!144 = !DILocation(line: 101, column: 21, scope: !132)
!145 = !DILocation(line: 101, column: 13, scope: !132)
!146 = !DILocation(line: 102, column: 13, scope: !132)
!147 = !DILocation(line: 102, column: 31, scope: !132)
!148 = !DILocation(line: 104, column: 20, scope: !132)
!149 = !DILocation(line: 104, column: 18, scope: !132)
!150 = !DILocalVariable(name: "dest", scope: !151, file: !17, line: 108, type: !45)
!151 = distinct !DILexicalBlock(scope: !127, file: !17, line: 107, column: 5)
!152 = !DILocation(line: 108, column: 17, scope: !151)
!153 = !DILocation(line: 109, column: 17, scope: !151)
!154 = !DILocation(line: 109, column: 9, scope: !151)
!155 = !DILocation(line: 110, column: 9, scope: !151)
!156 = !DILocation(line: 110, column: 21, scope: !151)
!157 = !DILocation(line: 112, column: 17, scope: !151)
!158 = !DILocation(line: 112, column: 23, scope: !151)
!159 = !DILocation(line: 112, column: 36, scope: !151)
!160 = !DILocation(line: 112, column: 29, scope: !151)
!161 = !DILocation(line: 112, column: 9, scope: !151)
!162 = !DILocation(line: 114, column: 9, scope: !151)
!163 = !DILocation(line: 114, column: 21, scope: !151)
!164 = !DILocation(line: 115, column: 20, scope: !151)
!165 = !DILocation(line: 115, column: 9, scope: !151)
!166 = !DILocation(line: 119, column: 1, scope: !127)
