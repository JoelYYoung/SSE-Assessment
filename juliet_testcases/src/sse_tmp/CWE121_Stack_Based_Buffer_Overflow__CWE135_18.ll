; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !28
  br label %sink, !dbg !29

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !30), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !32, metadata !DIExpression()), !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i64 @strlen(i8* %0) #5, !dbg !38
  store i64 %call, i64* %dataLen, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !39, metadata !DIExpression()), !dbg !40
  %1 = load i64, i64* %dataLen, align 8, !dbg !41
  %add = add i64 %1, 1, !dbg !41
  %mul = mul i64 %add, 4, !dbg !41
  %2 = alloca i8, i64 %mul, align 16, !dbg !41
  store i8* %2, i8** %dest, align 8, !dbg !40
  %3 = load i8*, i8** %dest, align 8, !dbg !42
  %4 = bitcast i8* %3 to i32*, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %6 = bitcast i8* %5 to i32*, !dbg !43
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !44
  %7 = load i8*, i8** %dest, align 8, !dbg !45
  call void @printLine(i8* %7), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_18_good() #0 !dbg !48 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_18_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_18_bad(), !dbg !67
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
  br label %source, !dbg !74

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !75), !dbg !76
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !77
  br label %sink, !dbg !78

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !79), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !81, metadata !DIExpression()), !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  %call = call i64 @wcslen(i32* %1) #5, !dbg !86
  store i64 %call, i64* %dataLen, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !87, metadata !DIExpression()), !dbg !88
  %2 = load i64, i64* %dataLen, align 8, !dbg !89
  %add = add i64 %2, 1, !dbg !89
  %mul = mul i64 %add, 4, !dbg !89
  %3 = alloca i8, i64 %mul, align 16, !dbg !89
  store i8* %3, i8** %dest, align 8, !dbg !88
  %4 = load i8*, i8** %dest, align 8, !dbg !90
  %5 = bitcast i8* %4 to i32*, !dbg !90
  %6 = load i8*, i8** %data, align 8, !dbg !91
  %7 = bitcast i8* %6 to i32*, !dbg !91
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !92
  %8 = load i8*, i8** %dest, align 8, !dbg !93
  %9 = bitcast i8* %8 to i32*, !dbg !94
  call void @printWLine(i32* %9), !dbg !95
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
  br label %source, !dbg !101

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !102), !dbg !103
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !104
  br label %sink, !dbg !105

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !106), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !108, metadata !DIExpression()), !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %call = call i64 @strlen(i8* %0) #5, !dbg !112
  store i64 %call, i64* %dataLen, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = load i64, i64* %dataLen, align 8, !dbg !115
  %add = add i64 %1, 1, !dbg !115
  %mul = mul i64 %add, 1, !dbg !115
  %2 = alloca i8, i64 %mul, align 16, !dbg !115
  store i8* %2, i8** %dest, align 8, !dbg !114
  %3 = load i8*, i8** %dest, align 8, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !118
  %5 = load i8*, i8** %dest, align 8, !dbg !119
  call void @printLine(i8* %5), !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_18_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_18.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 5, scope: !18)
!26 = !DILabel(scope: !18, name: "source", file: !19, line: 32)
!27 = !DILocation(line: 32, column: 1, scope: !18)
!28 = !DILocation(line: 34, column: 10, scope: !18)
!29 = !DILocation(line: 35, column: 5, scope: !18)
!30 = !DILabel(scope: !18, name: "sink", file: !19, line: 36)
!31 = !DILocation(line: 36, column: 1, scope: !18)
!32 = !DILocalVariable(name: "dataLen", scope: !33, file: !19, line: 39, type: !34)
!33 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !35)
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 39, column: 16, scope: !33)
!37 = !DILocation(line: 39, column: 41, scope: !33)
!38 = !DILocation(line: 39, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !33, file: !19, line: 40, type: !4)
!40 = !DILocation(line: 40, column: 16, scope: !33)
!41 = !DILocation(line: 40, column: 31, scope: !33)
!42 = !DILocation(line: 41, column: 22, scope: !33)
!43 = !DILocation(line: 41, column: 28, scope: !33)
!44 = !DILocation(line: 41, column: 15, scope: !33)
!45 = !DILocation(line: 42, column: 27, scope: !33)
!46 = !DILocation(line: 42, column: 9, scope: !33)
!47 = !DILocation(line: 44, column: 1, scope: !18)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_18_good", scope: !19, file: !19, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 92, column: 5, scope: !48)
!50 = !DILocation(line: 93, column: 5, scope: !48)
!51 = !DILocation(line: 94, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 105, type: !53, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!11, !11, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !19, line: 105, type: !11)
!57 = !DILocation(line: 105, column: 14, scope: !52)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !19, line: 105, type: !55)
!59 = !DILocation(line: 105, column: 27, scope: !52)
!60 = !DILocation(line: 108, column: 22, scope: !52)
!61 = !DILocation(line: 108, column: 12, scope: !52)
!62 = !DILocation(line: 108, column: 5, scope: !52)
!63 = !DILocation(line: 110, column: 5, scope: !52)
!64 = !DILocation(line: 111, column: 5, scope: !52)
!65 = !DILocation(line: 112, column: 5, scope: !52)
!66 = !DILocation(line: 115, column: 5, scope: !52)
!67 = !DILocation(line: 116, column: 5, scope: !52)
!68 = !DILocation(line: 117, column: 5, scope: !52)
!69 = !DILocation(line: 119, column: 5, scope: !52)
!70 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !19, line: 53, type: !4)
!72 = !DILocation(line: 53, column: 12, scope: !70)
!73 = !DILocation(line: 54, column: 10, scope: !70)
!74 = !DILocation(line: 55, column: 5, scope: !70)
!75 = !DILabel(scope: !70, name: "source", file: !19, line: 56)
!76 = !DILocation(line: 56, column: 1, scope: !70)
!77 = !DILocation(line: 58, column: 10, scope: !70)
!78 = !DILocation(line: 59, column: 5, scope: !70)
!79 = !DILabel(scope: !70, name: "sink", file: !19, line: 60)
!80 = !DILocation(line: 60, column: 1, scope: !70)
!81 = !DILocalVariable(name: "dataLen", scope: !82, file: !19, line: 63, type: !34)
!82 = distinct !DILexicalBlock(scope: !70, file: !19, line: 61, column: 5)
!83 = !DILocation(line: 63, column: 16, scope: !82)
!84 = !DILocation(line: 63, column: 44, scope: !82)
!85 = !DILocation(line: 63, column: 33, scope: !82)
!86 = !DILocation(line: 63, column: 26, scope: !82)
!87 = !DILocalVariable(name: "dest", scope: !82, file: !19, line: 64, type: !4)
!88 = !DILocation(line: 64, column: 16, scope: !82)
!89 = !DILocation(line: 64, column: 31, scope: !82)
!90 = !DILocation(line: 65, column: 22, scope: !82)
!91 = !DILocation(line: 65, column: 28, scope: !82)
!92 = !DILocation(line: 65, column: 15, scope: !82)
!93 = !DILocation(line: 66, column: 31, scope: !82)
!94 = !DILocation(line: 66, column: 20, scope: !82)
!95 = !DILocation(line: 66, column: 9, scope: !82)
!96 = !DILocation(line: 68, column: 1, scope: !70)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 73, type: !4)
!99 = !DILocation(line: 73, column: 12, scope: !97)
!100 = !DILocation(line: 74, column: 10, scope: !97)
!101 = !DILocation(line: 75, column: 5, scope: !97)
!102 = !DILabel(scope: !97, name: "source", file: !19, line: 76)
!103 = !DILocation(line: 76, column: 1, scope: !97)
!104 = !DILocation(line: 78, column: 10, scope: !97)
!105 = !DILocation(line: 79, column: 5, scope: !97)
!106 = !DILabel(scope: !97, name: "sink", file: !19, line: 80)
!107 = !DILocation(line: 80, column: 1, scope: !97)
!108 = !DILocalVariable(name: "dataLen", scope: !109, file: !19, line: 83, type: !34)
!109 = distinct !DILexicalBlock(scope: !97, file: !19, line: 81, column: 5)
!110 = !DILocation(line: 83, column: 16, scope: !109)
!111 = !DILocation(line: 83, column: 41, scope: !109)
!112 = !DILocation(line: 83, column: 26, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !109, file: !19, line: 84, type: !4)
!114 = !DILocation(line: 84, column: 16, scope: !109)
!115 = !DILocation(line: 84, column: 31, scope: !109)
!116 = !DILocation(line: 85, column: 22, scope: !109)
!117 = !DILocation(line: 85, column: 28, scope: !109)
!118 = !DILocation(line: 85, column: 15, scope: !109)
!119 = !DILocation(line: 86, column: 27, scope: !109)
!120 = !DILocation(line: 86, column: 9, scope: !109)
!121 = !DILocation(line: 88, column: 1, scope: !97)
