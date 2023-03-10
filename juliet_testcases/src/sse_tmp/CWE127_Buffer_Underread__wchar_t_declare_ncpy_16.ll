; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_16_bad() #0 !dbg !11 {
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
  br label %while.body, !dbg !30

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !33
  store i32* %add.ptr, i32** %data, align 8, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !40
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx4, align 4, !dbg !42
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %0 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !46
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !47
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx9, align 4, !dbg !49
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  call void @printWLine(i32* %arraydecay10), !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_16_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_16_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_16_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !82
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  br label %while.body, !dbg !85

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay1, i32** %data, align 8, !dbg !88
  br label %while.end, !dbg !89

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !94
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx4, align 4, !dbg !96
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !99
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !100
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !101
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx9, align 4, !dbg !103
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  call void @printWLine(i32* %arraydecay10), !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 32, column: 27, scope: !32)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 9, scope: !32)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 36, type: !22)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 36, column: 17, scope: !37)
!39 = !DILocation(line: 37, column: 17, scope: !37)
!40 = !DILocation(line: 37, column: 9, scope: !37)
!41 = !DILocation(line: 38, column: 9, scope: !37)
!42 = !DILocation(line: 38, column: 21, scope: !37)
!43 = !DILocation(line: 40, column: 17, scope: !37)
!44 = !DILocation(line: 40, column: 23, scope: !37)
!45 = !DILocation(line: 40, column: 36, scope: !37)
!46 = !DILocation(line: 40, column: 29, scope: !37)
!47 = !DILocation(line: 40, column: 9, scope: !37)
!48 = !DILocation(line: 42, column: 9, scope: !37)
!49 = !DILocation(line: 42, column: 21, scope: !37)
!50 = !DILocation(line: 43, column: 20, scope: !37)
!51 = !DILocation(line: 43, column: 9, scope: !37)
!52 = !DILocation(line: 45, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_16_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !57, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 91, type: !19)
!63 = !DILocation(line: 91, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 91, type: !59)
!65 = !DILocation(line: 91, column: 27, scope: !56)
!66 = !DILocation(line: 94, column: 22, scope: !56)
!67 = !DILocation(line: 94, column: 12, scope: !56)
!68 = !DILocation(line: 94, column: 5, scope: !56)
!69 = !DILocation(line: 96, column: 5, scope: !56)
!70 = !DILocation(line: 97, column: 5, scope: !56)
!71 = !DILocation(line: 98, column: 5, scope: !56)
!72 = !DILocation(line: 101, column: 5, scope: !56)
!73 = !DILocation(line: 102, column: 5, scope: !56)
!74 = !DILocation(line: 103, column: 5, scope: !56)
!75 = !DILocation(line: 105, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 54, type: !16)
!78 = !DILocation(line: 54, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 55, type: !22)
!80 = !DILocation(line: 55, column: 13, scope: !76)
!81 = !DILocation(line: 56, column: 13, scope: !76)
!82 = !DILocation(line: 56, column: 5, scope: !76)
!83 = !DILocation(line: 57, column: 5, scope: !76)
!84 = !DILocation(line: 57, column: 23, scope: !76)
!85 = !DILocation(line: 58, column: 5, scope: !76)
!86 = !DILocation(line: 61, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !76, file: !12, line: 59, column: 5)
!88 = !DILocation(line: 61, column: 14, scope: !87)
!89 = !DILocation(line: 62, column: 9, scope: !87)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 65, type: !22)
!91 = distinct !DILexicalBlock(scope: !76, file: !12, line: 64, column: 5)
!92 = !DILocation(line: 65, column: 17, scope: !91)
!93 = !DILocation(line: 66, column: 17, scope: !91)
!94 = !DILocation(line: 66, column: 9, scope: !91)
!95 = !DILocation(line: 67, column: 9, scope: !91)
!96 = !DILocation(line: 67, column: 21, scope: !91)
!97 = !DILocation(line: 69, column: 17, scope: !91)
!98 = !DILocation(line: 69, column: 23, scope: !91)
!99 = !DILocation(line: 69, column: 36, scope: !91)
!100 = !DILocation(line: 69, column: 29, scope: !91)
!101 = !DILocation(line: 69, column: 9, scope: !91)
!102 = !DILocation(line: 71, column: 9, scope: !91)
!103 = !DILocation(line: 71, column: 21, scope: !91)
!104 = !DILocation(line: 72, column: 20, scope: !91)
!105 = !DILocation(line: 72, column: 9, scope: !91)
!106 = !DILocation(line: 74, column: 1, scope: !76)
