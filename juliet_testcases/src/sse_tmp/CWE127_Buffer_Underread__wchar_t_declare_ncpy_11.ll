; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call1, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !41
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx5, align 4, !dbg !44
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %0 = load i32*, i32** %data, align 8, !dbg !46
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !48
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %0, i64 %call8) #5, !dbg !49
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx10, align 4, !dbg !51
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  call void @printWLine(i32* %arraydecay11), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_11_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_11_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_11_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call1, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay2, i32** %data, align 8, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !100
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !101
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx5, align 4, !dbg !103
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  %0 = load i32*, i32** %data, align 8, !dbg !105
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !107
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %0, i64 %call8) #5, !dbg !108
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx10, align 4, !dbg !110
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  call void @printWLine(i32* %arraydecay11), !dbg !112
  ret void, !dbg !113
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call1, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay2, i32** %data, align 8, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !134
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx5, align 4, !dbg !136
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  %0 = load i32*, i32** %data, align 8, !dbg !138
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !140
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %0, i64 %call8) #5, !dbg !141
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx10, align 4, !dbg !143
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  call void @printWLine(i32* %arraydecay11), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 29, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!32 = !DILocation(line: 29, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 14, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 35, type: !22)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DILocation(line: 35, column: 17, scope: !39)
!41 = !DILocation(line: 36, column: 17, scope: !39)
!42 = !DILocation(line: 36, column: 9, scope: !39)
!43 = !DILocation(line: 37, column: 9, scope: !39)
!44 = !DILocation(line: 37, column: 21, scope: !39)
!45 = !DILocation(line: 39, column: 17, scope: !39)
!46 = !DILocation(line: 39, column: 23, scope: !39)
!47 = !DILocation(line: 39, column: 36, scope: !39)
!48 = !DILocation(line: 39, column: 29, scope: !39)
!49 = !DILocation(line: 39, column: 9, scope: !39)
!50 = !DILocation(line: 41, column: 9, scope: !39)
!51 = !DILocation(line: 41, column: 21, scope: !39)
!52 = !DILocation(line: 42, column: 20, scope: !39)
!53 = !DILocation(line: 42, column: 9, scope: !39)
!54 = !DILocation(line: 44, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_11_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 105, column: 5, scope: !55)
!57 = !DILocation(line: 106, column: 5, scope: !55)
!58 = !DILocation(line: 107, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !60, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 119, type: !19)
!66 = !DILocation(line: 119, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 119, type: !62)
!68 = !DILocation(line: 119, column: 27, scope: !59)
!69 = !DILocation(line: 122, column: 22, scope: !59)
!70 = !DILocation(line: 122, column: 12, scope: !59)
!71 = !DILocation(line: 122, column: 5, scope: !59)
!72 = !DILocation(line: 124, column: 5, scope: !59)
!73 = !DILocation(line: 125, column: 5, scope: !59)
!74 = !DILocation(line: 126, column: 5, scope: !59)
!75 = !DILocation(line: 129, column: 5, scope: !59)
!76 = !DILocation(line: 130, column: 5, scope: !59)
!77 = !DILocation(line: 131, column: 5, scope: !59)
!78 = !DILocation(line: 133, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 53, type: !16)
!81 = !DILocation(line: 53, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 54, type: !22)
!83 = !DILocation(line: 54, column: 13, scope: !79)
!84 = !DILocation(line: 55, column: 13, scope: !79)
!85 = !DILocation(line: 55, column: 5, scope: !79)
!86 = !DILocation(line: 56, column: 5, scope: !79)
!87 = !DILocation(line: 56, column: 23, scope: !79)
!88 = !DILocation(line: 57, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !12, line: 57, column: 8)
!90 = !DILocation(line: 57, column: 8, scope: !79)
!91 = !DILocation(line: 60, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 58, column: 5)
!93 = !DILocation(line: 61, column: 5, scope: !92)
!94 = !DILocation(line: 65, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !12, line: 63, column: 5)
!96 = !DILocation(line: 65, column: 14, scope: !95)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 68, type: !22)
!98 = distinct !DILexicalBlock(scope: !79, file: !12, line: 67, column: 5)
!99 = !DILocation(line: 68, column: 17, scope: !98)
!100 = !DILocation(line: 69, column: 17, scope: !98)
!101 = !DILocation(line: 69, column: 9, scope: !98)
!102 = !DILocation(line: 70, column: 9, scope: !98)
!103 = !DILocation(line: 70, column: 21, scope: !98)
!104 = !DILocation(line: 72, column: 17, scope: !98)
!105 = !DILocation(line: 72, column: 23, scope: !98)
!106 = !DILocation(line: 72, column: 36, scope: !98)
!107 = !DILocation(line: 72, column: 29, scope: !98)
!108 = !DILocation(line: 72, column: 9, scope: !98)
!109 = !DILocation(line: 74, column: 9, scope: !98)
!110 = !DILocation(line: 74, column: 21, scope: !98)
!111 = !DILocation(line: 75, column: 20, scope: !98)
!112 = !DILocation(line: 75, column: 9, scope: !98)
!113 = !DILocation(line: 77, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 82, type: !16)
!116 = !DILocation(line: 82, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !12, line: 83, type: !22)
!118 = !DILocation(line: 83, column: 13, scope: !114)
!119 = !DILocation(line: 84, column: 13, scope: !114)
!120 = !DILocation(line: 84, column: 5, scope: !114)
!121 = !DILocation(line: 85, column: 5, scope: !114)
!122 = !DILocation(line: 85, column: 23, scope: !114)
!123 = !DILocation(line: 86, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !12, line: 86, column: 8)
!125 = !DILocation(line: 86, column: 8, scope: !114)
!126 = !DILocation(line: 89, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 87, column: 5)
!128 = !DILocation(line: 89, column: 14, scope: !127)
!129 = !DILocation(line: 90, column: 5, scope: !127)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !12, line: 92, type: !22)
!131 = distinct !DILexicalBlock(scope: !114, file: !12, line: 91, column: 5)
!132 = !DILocation(line: 92, column: 17, scope: !131)
!133 = !DILocation(line: 93, column: 17, scope: !131)
!134 = !DILocation(line: 93, column: 9, scope: !131)
!135 = !DILocation(line: 94, column: 9, scope: !131)
!136 = !DILocation(line: 94, column: 21, scope: !131)
!137 = !DILocation(line: 96, column: 17, scope: !131)
!138 = !DILocation(line: 96, column: 23, scope: !131)
!139 = !DILocation(line: 96, column: 36, scope: !131)
!140 = !DILocation(line: 96, column: 29, scope: !131)
!141 = !DILocation(line: 96, column: 9, scope: !131)
!142 = !DILocation(line: 98, column: 9, scope: !131)
!143 = !DILocation(line: 98, column: 21, scope: !131)
!144 = !DILocation(line: 99, column: 20, scope: !131)
!145 = !DILocation(line: 99, column: 9, scope: !131)
!146 = !DILocation(line: 101, column: 1, scope: !114)
