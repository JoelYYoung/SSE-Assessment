; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_16_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !26
  br label %while.end, !dbg !28

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !29

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !30, metadata !DIExpression()), !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %call = call i64 @strlen(i8* %0) #5, !dbg !37
  store i64 %call, i64* %dataLen, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !38, metadata !DIExpression()), !dbg !39
  %1 = load i64, i64* %dataLen, align 8, !dbg !40
  %add = add i64 %1, 1, !dbg !40
  %mul = mul i64 %add, 4, !dbg !40
  %2 = alloca i8, i64 %mul, align 16, !dbg !40
  store i8* %2, i8** %dest, align 8, !dbg !39
  %3 = load i8*, i8** %dest, align 8, !dbg !41
  %4 = bitcast i8* %3 to i32*, !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !42
  %6 = bitcast i8* %5 to i32*, !dbg !42
  %call2 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !43
  %7 = load i8*, i8** %dest, align 8, !dbg !44
  call void @printLine(i8* %7), !dbg !45
  br label %while.end3, !dbg !46

while.end3:                                       ; preds = %while.body1
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_16_good() #0 !dbg !48 {
entry:
  call void @goodB2G(), !dbg !49
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_16_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_16_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* null, i8** %data, align 8, !dbg !73
  br label %while.body, !dbg !74

while.body:                                       ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !75
  br label %while.end, !dbg !77

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !78

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !79, metadata !DIExpression()), !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  %call = call i64 @wcslen(i32* %1) #5, !dbg !85
  store i64 %call, i64* %dataLen, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !86, metadata !DIExpression()), !dbg !87
  %2 = load i64, i64* %dataLen, align 8, !dbg !88
  %add = add i64 %2, 1, !dbg !88
  %mul = mul i64 %add, 4, !dbg !88
  %3 = alloca i8, i64 %mul, align 16, !dbg !88
  store i8* %3, i8** %dest, align 8, !dbg !87
  %4 = load i8*, i8** %dest, align 8, !dbg !89
  %5 = bitcast i8* %4 to i32*, !dbg !89
  %6 = load i8*, i8** %data, align 8, !dbg !90
  %7 = bitcast i8* %6 to i32*, !dbg !90
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !91
  %8 = load i8*, i8** %dest, align 8, !dbg !92
  %9 = bitcast i8* %8 to i32*, !dbg !93
  call void @printWLine(i32* %9), !dbg !94
  br label %while.end3, !dbg !95

while.end3:                                       ; preds = %while.body1
  ret void, !dbg !96
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  br label %while.body, !dbg !101

while.body:                                       ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !102
  br label %while.end, !dbg !104

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !105

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !106, metadata !DIExpression()), !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  %call = call i64 @strlen(i8* %0) #5, !dbg !111
  store i64 %call, i64* %dataLen, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !112, metadata !DIExpression()), !dbg !113
  %1 = load i64, i64* %dataLen, align 8, !dbg !114
  %add = add i64 %1, 1, !dbg !114
  %mul = mul i64 %add, 1, !dbg !114
  %2 = alloca i8, i64 %mul, align 16, !dbg !114
  store i8* %2, i8** %dest, align 8, !dbg !113
  %3 = load i8*, i8** %dest, align 8, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %call2 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !117
  %5 = load i8*, i8** %dest, align 8, !dbg !118
  call void @printLine(i8* %5), !dbg !119
  br label %while.end3, !dbg !120

while.end3:                                       ; preds = %while.body1
  ret void, !dbg !121
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_16_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_16.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 5, scope: !18)
!26 = !DILocation(line: 34, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 5)
!28 = !DILocation(line: 35, column: 9, scope: !27)
!29 = !DILocation(line: 37, column: 5, scope: !18)
!30 = !DILocalVariable(name: "dataLen", scope: !31, file: !19, line: 41, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !19, line: 39, column: 9)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 38, column: 5)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !34)
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 41, column: 20, scope: !31)
!36 = !DILocation(line: 41, column: 45, scope: !31)
!37 = !DILocation(line: 41, column: 30, scope: !31)
!38 = !DILocalVariable(name: "dest", scope: !31, file: !19, line: 42, type: !4)
!39 = !DILocation(line: 42, column: 20, scope: !31)
!40 = !DILocation(line: 42, column: 35, scope: !31)
!41 = !DILocation(line: 43, column: 26, scope: !31)
!42 = !DILocation(line: 43, column: 32, scope: !31)
!43 = !DILocation(line: 43, column: 19, scope: !31)
!44 = !DILocation(line: 44, column: 31, scope: !31)
!45 = !DILocation(line: 44, column: 13, scope: !31)
!46 = !DILocation(line: 46, column: 9, scope: !32)
!47 = !DILocation(line: 48, column: 1, scope: !18)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_16_good", scope: !19, file: !19, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 104, column: 5, scope: !48)
!50 = !DILocation(line: 105, column: 5, scope: !48)
!51 = !DILocation(line: 106, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 117, type: !53, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!11, !11, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !19, line: 117, type: !11)
!57 = !DILocation(line: 117, column: 14, scope: !52)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !19, line: 117, type: !55)
!59 = !DILocation(line: 117, column: 27, scope: !52)
!60 = !DILocation(line: 120, column: 22, scope: !52)
!61 = !DILocation(line: 120, column: 12, scope: !52)
!62 = !DILocation(line: 120, column: 5, scope: !52)
!63 = !DILocation(line: 122, column: 5, scope: !52)
!64 = !DILocation(line: 123, column: 5, scope: !52)
!65 = !DILocation(line: 124, column: 5, scope: !52)
!66 = !DILocation(line: 127, column: 5, scope: !52)
!67 = !DILocation(line: 128, column: 5, scope: !52)
!68 = !DILocation(line: 129, column: 5, scope: !52)
!69 = !DILocation(line: 131, column: 5, scope: !52)
!70 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !19, line: 57, type: !4)
!72 = !DILocation(line: 57, column: 12, scope: !70)
!73 = !DILocation(line: 58, column: 10, scope: !70)
!74 = !DILocation(line: 59, column: 5, scope: !70)
!75 = !DILocation(line: 62, column: 14, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !19, line: 60, column: 5)
!77 = !DILocation(line: 63, column: 9, scope: !76)
!78 = !DILocation(line: 65, column: 5, scope: !70)
!79 = !DILocalVariable(name: "dataLen", scope: !80, file: !19, line: 69, type: !33)
!80 = distinct !DILexicalBlock(scope: !81, file: !19, line: 67, column: 9)
!81 = distinct !DILexicalBlock(scope: !70, file: !19, line: 66, column: 5)
!82 = !DILocation(line: 69, column: 20, scope: !80)
!83 = !DILocation(line: 69, column: 48, scope: !80)
!84 = !DILocation(line: 69, column: 37, scope: !80)
!85 = !DILocation(line: 69, column: 30, scope: !80)
!86 = !DILocalVariable(name: "dest", scope: !80, file: !19, line: 70, type: !4)
!87 = !DILocation(line: 70, column: 20, scope: !80)
!88 = !DILocation(line: 70, column: 35, scope: !80)
!89 = !DILocation(line: 71, column: 26, scope: !80)
!90 = !DILocation(line: 71, column: 32, scope: !80)
!91 = !DILocation(line: 71, column: 19, scope: !80)
!92 = !DILocation(line: 72, column: 35, scope: !80)
!93 = !DILocation(line: 72, column: 24, scope: !80)
!94 = !DILocation(line: 72, column: 13, scope: !80)
!95 = !DILocation(line: 74, column: 9, scope: !81)
!96 = !DILocation(line: 76, column: 1, scope: !70)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 81, type: !4)
!99 = !DILocation(line: 81, column: 12, scope: !97)
!100 = !DILocation(line: 82, column: 10, scope: !97)
!101 = !DILocation(line: 83, column: 5, scope: !97)
!102 = !DILocation(line: 86, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !19, line: 84, column: 5)
!104 = !DILocation(line: 87, column: 9, scope: !103)
!105 = !DILocation(line: 89, column: 5, scope: !97)
!106 = !DILocalVariable(name: "dataLen", scope: !107, file: !19, line: 93, type: !33)
!107 = distinct !DILexicalBlock(scope: !108, file: !19, line: 91, column: 9)
!108 = distinct !DILexicalBlock(scope: !97, file: !19, line: 90, column: 5)
!109 = !DILocation(line: 93, column: 20, scope: !107)
!110 = !DILocation(line: 93, column: 45, scope: !107)
!111 = !DILocation(line: 93, column: 30, scope: !107)
!112 = !DILocalVariable(name: "dest", scope: !107, file: !19, line: 94, type: !4)
!113 = !DILocation(line: 94, column: 20, scope: !107)
!114 = !DILocation(line: 94, column: 35, scope: !107)
!115 = !DILocation(line: 95, column: 26, scope: !107)
!116 = !DILocation(line: 95, column: 32, scope: !107)
!117 = !DILocation(line: 95, column: 19, scope: !107)
!118 = !DILocation(line: 96, column: 31, scope: !107)
!119 = !DILocation(line: 96, column: 13, scope: !107)
!120 = !DILocation(line: 98, column: 9, scope: !108)
!121 = !DILocation(line: 100, column: 1, scope: !97)
