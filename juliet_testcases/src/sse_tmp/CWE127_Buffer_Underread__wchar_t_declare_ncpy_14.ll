; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_14_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !43
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx4, align 4, !dbg !45
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !49
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %1, i64 %call7) #5, !dbg !50
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx9, align 4, !dbg !52
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  call void @printWLine(i32* %arraydecay10), !dbg !54
  ret void, !dbg !55
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_14_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_14_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_14_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %0 = load i32, i32* @globalFive, align 4, !dbg !89
  %cmp = icmp ne i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay1, i32** %data, align 8, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !103
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx4, align 4, !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !109
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %1, i64 %call7) #5, !dbg !110
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx9, align 4, !dbg !112
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay10), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !121
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !122
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %0 = load i32, i32* @globalFive, align 4, !dbg !125
  %cmp = icmp eq i32 %0, 5, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !129
  store i32* %arraydecay1, i32** %data, align 8, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !137
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx4, align 4, !dbg !139
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %1 = load i32*, i32** %data, align 8, !dbg !141
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !143
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %1, i64 %call7) #5, !dbg !144
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx9, align 4, !dbg !146
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  call void @printWLine(i32* %arraydecay10), !dbg !148
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!32 = !DILocation(line: 29, column: 18, scope: !31)
!33 = !DILocation(line: 29, column: 8, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!36 = !DILocation(line: 32, column: 27, scope: !35)
!37 = !DILocation(line: 32, column: 14, scope: !35)
!38 = !DILocation(line: 33, column: 5, scope: !35)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 35, type: !22)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!41 = !DILocation(line: 35, column: 17, scope: !40)
!42 = !DILocation(line: 36, column: 17, scope: !40)
!43 = !DILocation(line: 36, column: 9, scope: !40)
!44 = !DILocation(line: 37, column: 9, scope: !40)
!45 = !DILocation(line: 37, column: 21, scope: !40)
!46 = !DILocation(line: 39, column: 17, scope: !40)
!47 = !DILocation(line: 39, column: 23, scope: !40)
!48 = !DILocation(line: 39, column: 36, scope: !40)
!49 = !DILocation(line: 39, column: 29, scope: !40)
!50 = !DILocation(line: 39, column: 9, scope: !40)
!51 = !DILocation(line: 41, column: 9, scope: !40)
!52 = !DILocation(line: 41, column: 21, scope: !40)
!53 = !DILocation(line: 42, column: 20, scope: !40)
!54 = !DILocation(line: 42, column: 9, scope: !40)
!55 = !DILocation(line: 44, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_14_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 105, column: 5, scope: !56)
!58 = !DILocation(line: 106, column: 5, scope: !56)
!59 = !DILocation(line: 107, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !61, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!19, !19, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 119, type: !19)
!67 = !DILocation(line: 119, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 119, type: !63)
!69 = !DILocation(line: 119, column: 27, scope: !60)
!70 = !DILocation(line: 122, column: 22, scope: !60)
!71 = !DILocation(line: 122, column: 12, scope: !60)
!72 = !DILocation(line: 122, column: 5, scope: !60)
!73 = !DILocation(line: 124, column: 5, scope: !60)
!74 = !DILocation(line: 125, column: 5, scope: !60)
!75 = !DILocation(line: 126, column: 5, scope: !60)
!76 = !DILocation(line: 129, column: 5, scope: !60)
!77 = !DILocation(line: 130, column: 5, scope: !60)
!78 = !DILocation(line: 131, column: 5, scope: !60)
!79 = !DILocation(line: 133, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 53, type: !16)
!82 = !DILocation(line: 53, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 54, type: !22)
!84 = !DILocation(line: 54, column: 13, scope: !80)
!85 = !DILocation(line: 55, column: 13, scope: !80)
!86 = !DILocation(line: 55, column: 5, scope: !80)
!87 = !DILocation(line: 56, column: 5, scope: !80)
!88 = !DILocation(line: 56, column: 23, scope: !80)
!89 = !DILocation(line: 57, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 57, column: 8)
!91 = !DILocation(line: 57, column: 18, scope: !90)
!92 = !DILocation(line: 57, column: 8, scope: !80)
!93 = !DILocation(line: 60, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 58, column: 5)
!95 = !DILocation(line: 61, column: 5, scope: !94)
!96 = !DILocation(line: 65, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !12, line: 63, column: 5)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 68, type: !22)
!100 = distinct !DILexicalBlock(scope: !80, file: !12, line: 67, column: 5)
!101 = !DILocation(line: 68, column: 17, scope: !100)
!102 = !DILocation(line: 69, column: 17, scope: !100)
!103 = !DILocation(line: 69, column: 9, scope: !100)
!104 = !DILocation(line: 70, column: 9, scope: !100)
!105 = !DILocation(line: 70, column: 21, scope: !100)
!106 = !DILocation(line: 72, column: 17, scope: !100)
!107 = !DILocation(line: 72, column: 23, scope: !100)
!108 = !DILocation(line: 72, column: 36, scope: !100)
!109 = !DILocation(line: 72, column: 29, scope: !100)
!110 = !DILocation(line: 72, column: 9, scope: !100)
!111 = !DILocation(line: 74, column: 9, scope: !100)
!112 = !DILocation(line: 74, column: 21, scope: !100)
!113 = !DILocation(line: 75, column: 20, scope: !100)
!114 = !DILocation(line: 75, column: 9, scope: !100)
!115 = !DILocation(line: 77, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 82, type: !16)
!118 = !DILocation(line: 82, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !12, line: 83, type: !22)
!120 = !DILocation(line: 83, column: 13, scope: !116)
!121 = !DILocation(line: 84, column: 13, scope: !116)
!122 = !DILocation(line: 84, column: 5, scope: !116)
!123 = !DILocation(line: 85, column: 5, scope: !116)
!124 = !DILocation(line: 85, column: 23, scope: !116)
!125 = !DILocation(line: 86, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !12, line: 86, column: 8)
!127 = !DILocation(line: 86, column: 18, scope: !126)
!128 = !DILocation(line: 86, column: 8, scope: !116)
!129 = !DILocation(line: 89, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 87, column: 5)
!131 = !DILocation(line: 89, column: 14, scope: !130)
!132 = !DILocation(line: 90, column: 5, scope: !130)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 92, type: !22)
!134 = distinct !DILexicalBlock(scope: !116, file: !12, line: 91, column: 5)
!135 = !DILocation(line: 92, column: 17, scope: !134)
!136 = !DILocation(line: 93, column: 17, scope: !134)
!137 = !DILocation(line: 93, column: 9, scope: !134)
!138 = !DILocation(line: 94, column: 9, scope: !134)
!139 = !DILocation(line: 94, column: 21, scope: !134)
!140 = !DILocation(line: 96, column: 17, scope: !134)
!141 = !DILocation(line: 96, column: 23, scope: !134)
!142 = !DILocation(line: 96, column: 36, scope: !134)
!143 = !DILocation(line: 96, column: 29, scope: !134)
!144 = !DILocation(line: 96, column: 9, scope: !134)
!145 = !DILocation(line: 98, column: 9, scope: !134)
!146 = !DILocation(line: 98, column: 21, scope: !134)
!147 = !DILocation(line: 99, column: 20, scope: !134)
!148 = !DILocation(line: 99, column: 9, scope: !134)
!149 = !DILocation(line: 101, column: 1, scope: !116)
