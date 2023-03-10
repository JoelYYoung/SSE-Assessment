; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @globalTrue, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !50
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !51
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx7, align 4, !dbg !53
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  call void @printWLine(i32* %arraydecay8), !dbg !55
  ret void, !dbg !56
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 400, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBuffer, align 8, !dbg !85
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !89
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %4 = load i32, i32* @globalFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %4, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  store i32* %5, i32** %data, align 8, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !111
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !112
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx7, align 4, !dbg !114
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay8), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 400, align 16, !dbg !123
  %1 = bitcast i8* %0 to i32*, !dbg !124
  store i32* %1, i32** %dataBuffer, align 8, !dbg !122
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !126
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %4 = load i32, i32* @globalTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %4, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  store i32* %5, i32** %data, align 8, !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx2, align 4, !dbg !142
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %6 = load i32*, i32** %data, align 8, !dbg !144
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !146
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !147
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx7, align 4, !dbg !149
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  call void @printWLine(i32* %arraydecay8), !dbg !151
  ret void, !dbg !152
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 29, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!34 = !DILocation(line: 32, column: 27, scope: !33)
!35 = !DILocation(line: 32, column: 14, scope: !33)
!36 = !DILocation(line: 33, column: 5, scope: !33)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocation(line: 36, column: 17, scope: !38)
!44 = !DILocation(line: 36, column: 9, scope: !38)
!45 = !DILocation(line: 37, column: 9, scope: !38)
!46 = !DILocation(line: 37, column: 21, scope: !38)
!47 = !DILocation(line: 39, column: 17, scope: !38)
!48 = !DILocation(line: 39, column: 23, scope: !38)
!49 = !DILocation(line: 39, column: 36, scope: !38)
!50 = !DILocation(line: 39, column: 29, scope: !38)
!51 = !DILocation(line: 39, column: 9, scope: !38)
!52 = !DILocation(line: 41, column: 9, scope: !38)
!53 = !DILocation(line: 41, column: 21, scope: !38)
!54 = !DILocation(line: 42, column: 20, scope: !38)
!55 = !DILocation(line: 42, column: 9, scope: !38)
!56 = !DILocation(line: 44, column: 1, scope: !15)
!57 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_10_good", scope: !16, file: !16, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 105, column: 5, scope: !57)
!59 = !DILocation(line: 106, column: 5, scope: !57)
!60 = !DILocation(line: 107, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 119, type: !62, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !16, line: 119, type: !7)
!68 = !DILocation(line: 119, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !16, line: 119, type: !64)
!70 = !DILocation(line: 119, column: 27, scope: !61)
!71 = !DILocation(line: 122, column: 22, scope: !61)
!72 = !DILocation(line: 122, column: 12, scope: !61)
!73 = !DILocation(line: 122, column: 5, scope: !61)
!74 = !DILocation(line: 124, column: 5, scope: !61)
!75 = !DILocation(line: 125, column: 5, scope: !61)
!76 = !DILocation(line: 126, column: 5, scope: !61)
!77 = !DILocation(line: 129, column: 5, scope: !61)
!78 = !DILocation(line: 130, column: 5, scope: !61)
!79 = !DILocation(line: 131, column: 5, scope: !61)
!80 = !DILocation(line: 133, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 53, type: !4)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !16, line: 54, type: !4)
!85 = !DILocation(line: 54, column: 15, scope: !81)
!86 = !DILocation(line: 54, column: 39, scope: !81)
!87 = !DILocation(line: 54, column: 28, scope: !81)
!88 = !DILocation(line: 55, column: 13, scope: !81)
!89 = !DILocation(line: 55, column: 5, scope: !81)
!90 = !DILocation(line: 56, column: 5, scope: !81)
!91 = !DILocation(line: 56, column: 23, scope: !81)
!92 = !DILocation(line: 57, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !16, line: 57, column: 8)
!94 = !DILocation(line: 57, column: 8, scope: !81)
!95 = !DILocation(line: 60, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !16, line: 58, column: 5)
!97 = !DILocation(line: 61, column: 5, scope: !96)
!98 = !DILocation(line: 65, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !16, line: 63, column: 5)
!100 = !DILocation(line: 65, column: 14, scope: !99)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !16, line: 68, type: !39)
!102 = distinct !DILexicalBlock(scope: !81, file: !16, line: 67, column: 5)
!103 = !DILocation(line: 68, column: 17, scope: !102)
!104 = !DILocation(line: 69, column: 17, scope: !102)
!105 = !DILocation(line: 69, column: 9, scope: !102)
!106 = !DILocation(line: 70, column: 9, scope: !102)
!107 = !DILocation(line: 70, column: 21, scope: !102)
!108 = !DILocation(line: 72, column: 17, scope: !102)
!109 = !DILocation(line: 72, column: 23, scope: !102)
!110 = !DILocation(line: 72, column: 36, scope: !102)
!111 = !DILocation(line: 72, column: 29, scope: !102)
!112 = !DILocation(line: 72, column: 9, scope: !102)
!113 = !DILocation(line: 74, column: 9, scope: !102)
!114 = !DILocation(line: 74, column: 21, scope: !102)
!115 = !DILocation(line: 75, column: 20, scope: !102)
!116 = !DILocation(line: 75, column: 9, scope: !102)
!117 = !DILocation(line: 77, column: 1, scope: !81)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !16, line: 82, type: !4)
!120 = !DILocation(line: 82, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataBuffer", scope: !118, file: !16, line: 83, type: !4)
!122 = !DILocation(line: 83, column: 15, scope: !118)
!123 = !DILocation(line: 83, column: 39, scope: !118)
!124 = !DILocation(line: 83, column: 28, scope: !118)
!125 = !DILocation(line: 84, column: 13, scope: !118)
!126 = !DILocation(line: 84, column: 5, scope: !118)
!127 = !DILocation(line: 85, column: 5, scope: !118)
!128 = !DILocation(line: 85, column: 23, scope: !118)
!129 = !DILocation(line: 86, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !118, file: !16, line: 86, column: 8)
!131 = !DILocation(line: 86, column: 8, scope: !118)
!132 = !DILocation(line: 89, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !16, line: 87, column: 5)
!134 = !DILocation(line: 89, column: 14, scope: !133)
!135 = !DILocation(line: 90, column: 5, scope: !133)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !16, line: 92, type: !39)
!137 = distinct !DILexicalBlock(scope: !118, file: !16, line: 91, column: 5)
!138 = !DILocation(line: 92, column: 17, scope: !137)
!139 = !DILocation(line: 93, column: 17, scope: !137)
!140 = !DILocation(line: 93, column: 9, scope: !137)
!141 = !DILocation(line: 94, column: 9, scope: !137)
!142 = !DILocation(line: 94, column: 21, scope: !137)
!143 = !DILocation(line: 96, column: 17, scope: !137)
!144 = !DILocation(line: 96, column: 23, scope: !137)
!145 = !DILocation(line: 96, column: 36, scope: !137)
!146 = !DILocation(line: 96, column: 29, scope: !137)
!147 = !DILocation(line: 96, column: 9, scope: !137)
!148 = !DILocation(line: 98, column: 9, scope: !137)
!149 = !DILocation(line: 98, column: 21, scope: !137)
!150 = !DILocation(line: 99, column: 20, scope: !137)
!151 = !DILocation(line: 99, column: 9, scope: !137)
!152 = !DILocation(line: 101, column: 1, scope: !118)
