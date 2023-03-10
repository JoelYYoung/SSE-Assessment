; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !51
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !52
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx7, align 4, !dbg !54
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay8), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 400, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBuffer, align 8, !dbg !86
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !90
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  %4 = load i32, i32* @globalFive, align 4, !dbg !93
  %cmp = icmp ne i32 %4, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %5, i32** %data, align 8, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !113
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !114
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx7, align 4, !dbg !116
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay8), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = alloca i8, i64 400, align 16, !dbg !125
  %1 = bitcast i8* %0 to i32*, !dbg !126
  store i32* %1, i32** %dataBuffer, align 8, !dbg !124
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !127
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !128
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %4 = load i32, i32* @globalFive, align 4, !dbg !131
  %cmp = icmp eq i32 %4, 5, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !135
  store i32* %5, i32** %data, align 8, !dbg !137
  br label %if.end, !dbg !138

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !143
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx2, align 4, !dbg !145
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %6 = load i32*, i32** %data, align 8, !dbg !147
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !149
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !150
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx7, align 4, !dbg !152
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  call void @printWLine(i32* %arraydecay8), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 29, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!31 = !DILocation(line: 29, column: 18, scope: !30)
!32 = !DILocation(line: 29, column: 8, scope: !15)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 14, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !16, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 35, column: 17, scope: !39)
!44 = !DILocation(line: 36, column: 17, scope: !39)
!45 = !DILocation(line: 36, column: 9, scope: !39)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 37, column: 21, scope: !39)
!48 = !DILocation(line: 39, column: 17, scope: !39)
!49 = !DILocation(line: 39, column: 23, scope: !39)
!50 = !DILocation(line: 39, column: 36, scope: !39)
!51 = !DILocation(line: 39, column: 29, scope: !39)
!52 = !DILocation(line: 39, column: 9, scope: !39)
!53 = !DILocation(line: 41, column: 9, scope: !39)
!54 = !DILocation(line: 41, column: 21, scope: !39)
!55 = !DILocation(line: 42, column: 20, scope: !39)
!56 = !DILocation(line: 42, column: 9, scope: !39)
!57 = !DILocation(line: 44, column: 1, scope: !15)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_14_good", scope: !16, file: !16, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 105, column: 5, scope: !58)
!60 = !DILocation(line: 106, column: 5, scope: !58)
!61 = !DILocation(line: 107, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 119, type: !63, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !16, line: 119, type: !7)
!69 = !DILocation(line: 119, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !16, line: 119, type: !65)
!71 = !DILocation(line: 119, column: 27, scope: !62)
!72 = !DILocation(line: 122, column: 22, scope: !62)
!73 = !DILocation(line: 122, column: 12, scope: !62)
!74 = !DILocation(line: 122, column: 5, scope: !62)
!75 = !DILocation(line: 124, column: 5, scope: !62)
!76 = !DILocation(line: 125, column: 5, scope: !62)
!77 = !DILocation(line: 126, column: 5, scope: !62)
!78 = !DILocation(line: 129, column: 5, scope: !62)
!79 = !DILocation(line: 130, column: 5, scope: !62)
!80 = !DILocation(line: 131, column: 5, scope: !62)
!81 = !DILocation(line: 133, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !16, line: 53, type: !4)
!84 = !DILocation(line: 53, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !16, line: 54, type: !4)
!86 = !DILocation(line: 54, column: 15, scope: !82)
!87 = !DILocation(line: 54, column: 39, scope: !82)
!88 = !DILocation(line: 54, column: 28, scope: !82)
!89 = !DILocation(line: 55, column: 13, scope: !82)
!90 = !DILocation(line: 55, column: 5, scope: !82)
!91 = !DILocation(line: 56, column: 5, scope: !82)
!92 = !DILocation(line: 56, column: 23, scope: !82)
!93 = !DILocation(line: 57, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !16, line: 57, column: 8)
!95 = !DILocation(line: 57, column: 18, scope: !94)
!96 = !DILocation(line: 57, column: 8, scope: !82)
!97 = !DILocation(line: 60, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !16, line: 58, column: 5)
!99 = !DILocation(line: 61, column: 5, scope: !98)
!100 = !DILocation(line: 65, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !16, line: 63, column: 5)
!102 = !DILocation(line: 65, column: 14, scope: !101)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !16, line: 68, type: !40)
!104 = distinct !DILexicalBlock(scope: !82, file: !16, line: 67, column: 5)
!105 = !DILocation(line: 68, column: 17, scope: !104)
!106 = !DILocation(line: 69, column: 17, scope: !104)
!107 = !DILocation(line: 69, column: 9, scope: !104)
!108 = !DILocation(line: 70, column: 9, scope: !104)
!109 = !DILocation(line: 70, column: 21, scope: !104)
!110 = !DILocation(line: 72, column: 17, scope: !104)
!111 = !DILocation(line: 72, column: 23, scope: !104)
!112 = !DILocation(line: 72, column: 36, scope: !104)
!113 = !DILocation(line: 72, column: 29, scope: !104)
!114 = !DILocation(line: 72, column: 9, scope: !104)
!115 = !DILocation(line: 74, column: 9, scope: !104)
!116 = !DILocation(line: 74, column: 21, scope: !104)
!117 = !DILocation(line: 75, column: 20, scope: !104)
!118 = !DILocation(line: 75, column: 9, scope: !104)
!119 = !DILocation(line: 77, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !16, line: 82, type: !4)
!122 = !DILocation(line: 82, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !16, line: 83, type: !4)
!124 = !DILocation(line: 83, column: 15, scope: !120)
!125 = !DILocation(line: 83, column: 39, scope: !120)
!126 = !DILocation(line: 83, column: 28, scope: !120)
!127 = !DILocation(line: 84, column: 13, scope: !120)
!128 = !DILocation(line: 84, column: 5, scope: !120)
!129 = !DILocation(line: 85, column: 5, scope: !120)
!130 = !DILocation(line: 85, column: 23, scope: !120)
!131 = !DILocation(line: 86, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !16, line: 86, column: 8)
!133 = !DILocation(line: 86, column: 18, scope: !132)
!134 = !DILocation(line: 86, column: 8, scope: !120)
!135 = !DILocation(line: 89, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !16, line: 87, column: 5)
!137 = !DILocation(line: 89, column: 14, scope: !136)
!138 = !DILocation(line: 90, column: 5, scope: !136)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !16, line: 92, type: !40)
!140 = distinct !DILexicalBlock(scope: !120, file: !16, line: 91, column: 5)
!141 = !DILocation(line: 92, column: 17, scope: !140)
!142 = !DILocation(line: 93, column: 17, scope: !140)
!143 = !DILocation(line: 93, column: 9, scope: !140)
!144 = !DILocation(line: 94, column: 9, scope: !140)
!145 = !DILocation(line: 94, column: 21, scope: !140)
!146 = !DILocation(line: 96, column: 17, scope: !140)
!147 = !DILocation(line: 96, column: 23, scope: !140)
!148 = !DILocation(line: 96, column: 36, scope: !140)
!149 = !DILocation(line: 96, column: 29, scope: !140)
!150 = !DILocation(line: 96, column: 9, scope: !140)
!151 = !DILocation(line: 98, column: 9, scope: !140)
!152 = !DILocation(line: 98, column: 21, scope: !140)
!153 = !DILocation(line: 99, column: 20, scope: !140)
!154 = !DILocation(line: 99, column: 9, scope: !140)
!155 = !DILocation(line: 101, column: 1, scope: !120)
