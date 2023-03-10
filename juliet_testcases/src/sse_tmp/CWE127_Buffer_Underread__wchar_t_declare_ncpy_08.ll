; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_08_bad() #0 !dbg !11 {
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !30
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

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_08_good() #0 !dbg !55 {
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
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_08_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_08_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !79 {
entry:
  ret i32 1, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !89
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %call1 = call i32 @staticReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call1, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay2, i32** %data, align 8, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !105
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx5, align 4, !dbg !107
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !111
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %0, i64 %call8) #5, !dbg !112
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx10, align 4, !dbg !114
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay11), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !118 {
entry:
  ret i32 0, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !125
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %call1 = call i32 @staticReturnsTrue(), !dbg !129
  %tobool = icmp ne i32 %call1, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !132
  store i32* %arraydecay2, i32** %data, align 8, !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !140
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx5, align 4, !dbg !142
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %0 = load i32*, i32** %data, align 8, !dbg !144
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !146
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %0, i64 %call8) #5, !dbg !147
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx10, align 4, !dbg !149
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  call void @printWLine(i32* %arraydecay11), !dbg !151
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 13, scope: !11)
!27 = !DILocation(line: 41, column: 5, scope: !11)
!28 = !DILocation(line: 42, column: 5, scope: !11)
!29 = !DILocation(line: 42, column: 23, scope: !11)
!30 = !DILocation(line: 43, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 8)
!32 = !DILocation(line: 43, column: 8, scope: !11)
!33 = !DILocation(line: 46, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 44, column: 5)
!35 = !DILocation(line: 46, column: 27, scope: !34)
!36 = !DILocation(line: 46, column: 14, scope: !34)
!37 = !DILocation(line: 47, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 49, type: !22)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!40 = !DILocation(line: 49, column: 17, scope: !39)
!41 = !DILocation(line: 50, column: 17, scope: !39)
!42 = !DILocation(line: 50, column: 9, scope: !39)
!43 = !DILocation(line: 51, column: 9, scope: !39)
!44 = !DILocation(line: 51, column: 21, scope: !39)
!45 = !DILocation(line: 53, column: 17, scope: !39)
!46 = !DILocation(line: 53, column: 23, scope: !39)
!47 = !DILocation(line: 53, column: 36, scope: !39)
!48 = !DILocation(line: 53, column: 29, scope: !39)
!49 = !DILocation(line: 53, column: 9, scope: !39)
!50 = !DILocation(line: 55, column: 9, scope: !39)
!51 = !DILocation(line: 55, column: 21, scope: !39)
!52 = !DILocation(line: 56, column: 20, scope: !39)
!53 = !DILocation(line: 56, column: 9, scope: !39)
!54 = !DILocation(line: 58, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_08_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 119, column: 5, scope: !55)
!57 = !DILocation(line: 120, column: 5, scope: !55)
!58 = !DILocation(line: 121, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !60, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 133, type: !19)
!66 = !DILocation(line: 133, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 133, type: !62)
!68 = !DILocation(line: 133, column: 27, scope: !59)
!69 = !DILocation(line: 136, column: 22, scope: !59)
!70 = !DILocation(line: 136, column: 12, scope: !59)
!71 = !DILocation(line: 136, column: 5, scope: !59)
!72 = !DILocation(line: 138, column: 5, scope: !59)
!73 = !DILocation(line: 139, column: 5, scope: !59)
!74 = !DILocation(line: 140, column: 5, scope: !59)
!75 = !DILocation(line: 143, column: 5, scope: !59)
!76 = !DILocation(line: 144, column: 5, scope: !59)
!77 = !DILocation(line: 145, column: 5, scope: !59)
!78 = !DILocation(line: 147, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !80, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!19}
!82 = !DILocation(line: 27, column: 5, scope: !79)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 67, type: !16)
!85 = !DILocation(line: 67, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !12, line: 68, type: !22)
!87 = !DILocation(line: 68, column: 13, scope: !83)
!88 = !DILocation(line: 69, column: 13, scope: !83)
!89 = !DILocation(line: 69, column: 5, scope: !83)
!90 = !DILocation(line: 70, column: 5, scope: !83)
!91 = !DILocation(line: 70, column: 23, scope: !83)
!92 = !DILocation(line: 71, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !12, line: 71, column: 8)
!94 = !DILocation(line: 71, column: 8, scope: !83)
!95 = !DILocation(line: 74, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 72, column: 5)
!97 = !DILocation(line: 75, column: 5, scope: !96)
!98 = !DILocation(line: 79, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !12, line: 77, column: 5)
!100 = !DILocation(line: 79, column: 14, scope: !99)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 82, type: !22)
!102 = distinct !DILexicalBlock(scope: !83, file: !12, line: 81, column: 5)
!103 = !DILocation(line: 82, column: 17, scope: !102)
!104 = !DILocation(line: 83, column: 17, scope: !102)
!105 = !DILocation(line: 83, column: 9, scope: !102)
!106 = !DILocation(line: 84, column: 9, scope: !102)
!107 = !DILocation(line: 84, column: 21, scope: !102)
!108 = !DILocation(line: 86, column: 17, scope: !102)
!109 = !DILocation(line: 86, column: 23, scope: !102)
!110 = !DILocation(line: 86, column: 36, scope: !102)
!111 = !DILocation(line: 86, column: 29, scope: !102)
!112 = !DILocation(line: 86, column: 9, scope: !102)
!113 = !DILocation(line: 88, column: 9, scope: !102)
!114 = !DILocation(line: 88, column: 21, scope: !102)
!115 = !DILocation(line: 89, column: 20, scope: !102)
!116 = !DILocation(line: 89, column: 9, scope: !102)
!117 = !DILocation(line: 91, column: 1, scope: !83)
!118 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !80, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocation(line: 32, column: 5, scope: !118)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 96, type: !16)
!122 = !DILocation(line: 96, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !12, line: 97, type: !22)
!124 = !DILocation(line: 97, column: 13, scope: !120)
!125 = !DILocation(line: 98, column: 13, scope: !120)
!126 = !DILocation(line: 98, column: 5, scope: !120)
!127 = !DILocation(line: 99, column: 5, scope: !120)
!128 = !DILocation(line: 99, column: 23, scope: !120)
!129 = !DILocation(line: 100, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !120, file: !12, line: 100, column: 8)
!131 = !DILocation(line: 100, column: 8, scope: !120)
!132 = !DILocation(line: 103, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 101, column: 5)
!134 = !DILocation(line: 103, column: 14, scope: !133)
!135 = !DILocation(line: 104, column: 5, scope: !133)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !12, line: 106, type: !22)
!137 = distinct !DILexicalBlock(scope: !120, file: !12, line: 105, column: 5)
!138 = !DILocation(line: 106, column: 17, scope: !137)
!139 = !DILocation(line: 107, column: 17, scope: !137)
!140 = !DILocation(line: 107, column: 9, scope: !137)
!141 = !DILocation(line: 108, column: 9, scope: !137)
!142 = !DILocation(line: 108, column: 21, scope: !137)
!143 = !DILocation(line: 110, column: 17, scope: !137)
!144 = !DILocation(line: 110, column: 23, scope: !137)
!145 = !DILocation(line: 110, column: 36, scope: !137)
!146 = !DILocation(line: 110, column: 29, scope: !137)
!147 = !DILocation(line: 110, column: 9, scope: !137)
!148 = !DILocation(line: 112, column: 9, scope: !137)
!149 = !DILocation(line: 112, column: 21, scope: !137)
!150 = !DILocation(line: 113, column: 20, scope: !137)
!151 = !DILocation(line: 113, column: 9, scope: !137)
!152 = !DILocation(line: 115, column: 1, scope: !120)
