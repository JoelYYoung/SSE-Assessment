; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_64b_badSink(i8* %dataVoidPtr) #0 !dbg !18 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !26
  %1 = bitcast i8* %0 to i8**, !dbg !27
  store i8** %1, i8*** %dataPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !30
  %3 = load i8*, i8** %2, align 8, !dbg !31
  store i8* %3, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !32, metadata !DIExpression()), !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i64 @strlen(i8* %4) #5, !dbg !38
  store i64 %call, i64* %dataLen, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i64, i64* %dataLen, align 8, !dbg !41
  %add = add i64 %5, 1, !dbg !41
  %mul = mul i64 %add, 4, !dbg !41
  %6 = alloca i8, i64 %mul, align 16, !dbg !41
  store i8* %6, i8** %dest, align 8, !dbg !40
  %7 = load i8*, i8** %dest, align 8, !dbg !42
  %8 = bitcast i8* %7 to i32*, !dbg !42
  %9 = load i8*, i8** %data, align 8, !dbg !43
  %10 = bitcast i8* %9 to i32*, !dbg !43
  %call1 = call i32* @wcscpy(i32* %8, i32* %10) #6, !dbg !44
  %11 = load i8*, i8** %dest, align 8, !dbg !45
  call void @printLine(i8* %11), !dbg !46
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !48 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !53
  %1 = bitcast i8* %0 to i8**, !dbg !54
  store i8** %1, i8*** %dataPtr, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i8** %data, metadata !55, metadata !DIExpression()), !dbg !56
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !57
  %3 = load i8*, i8** %2, align 8, !dbg !58
  store i8* %3, i8** %data, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !61
  %4 = load i8*, i8** %data, align 8, !dbg !62
  %call = call i64 @strlen(i8* %4) #5, !dbg !63
  store i64 %call, i64* %dataLen, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !64, metadata !DIExpression()), !dbg !65
  %5 = load i64, i64* %dataLen, align 8, !dbg !66
  %add = add i64 %5, 1, !dbg !66
  %mul = mul i64 %add, 1, !dbg !66
  %6 = alloca i8, i64 %mul, align 16, !dbg !66
  store i8* %6, i8** %dest, align 8, !dbg !65
  %7 = load i8*, i8** %dest, align 8, !dbg !67
  %8 = load i8*, i8** %data, align 8, !dbg !68
  %call1 = call i8* @strcpy(i8* %7, i8* %8) #6, !dbg !69
  %9 = load i8*, i8** %dest, align 8, !dbg !70
  call void @printLine(i8* %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_64b_goodB2GSink(i8* %dataVoidPtr) #0 !dbg !73 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !78
  %1 = bitcast i8* %0 to i8**, !dbg !79
  store i8** %1, i8*** %dataPtr, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !82
  %3 = load i8*, i8** %2, align 8, !dbg !83
  store i8* %3, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !84, metadata !DIExpression()), !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %5 = bitcast i8* %4 to i32*, !dbg !88
  %call = call i64 @wcslen(i32* %5) #5, !dbg !89
  store i64 %call, i64* %dataLen, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !90, metadata !DIExpression()), !dbg !91
  %6 = load i64, i64* %dataLen, align 8, !dbg !92
  %add = add i64 %6, 1, !dbg !92
  %mul = mul i64 %add, 4, !dbg !92
  %7 = alloca i8, i64 %mul, align 16, !dbg !92
  store i8* %7, i8** %dest, align 8, !dbg !91
  %8 = load i8*, i8** %dest, align 8, !dbg !93
  %9 = bitcast i8* %8 to i32*, !dbg !93
  %10 = load i8*, i8** %data, align 8, !dbg !94
  %11 = bitcast i8* %10 to i32*, !dbg !94
  %call1 = call i32* @wcscpy(i32* %9, i32* %11) #6, !dbg !95
  %12 = load i8*, i8** %dest, align 8, !dbg !96
  %13 = bitcast i8* %12 to i32*, !dbg !97
  call void @printWLine(i32* %13), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !5, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_64b_badSink", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_64b.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !5}
!22 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !18, file: !19, line: 27, type: !5)
!23 = !DILocation(line: 27, column: 68, scope: !18)
!24 = !DILocalVariable(name: "dataPtr", scope: !18, file: !19, line: 30, type: !4)
!25 = !DILocation(line: 30, column: 14, scope: !18)
!26 = !DILocation(line: 30, column: 34, scope: !18)
!27 = !DILocation(line: 30, column: 24, scope: !18)
!28 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 32, type: !5)
!29 = !DILocation(line: 32, column: 12, scope: !18)
!30 = !DILocation(line: 32, column: 21, scope: !18)
!31 = !DILocation(line: 32, column: 20, scope: !18)
!32 = !DILocalVariable(name: "dataLen", scope: !33, file: !19, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !18, file: !19, line: 33, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !35)
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 35, column: 16, scope: !33)
!37 = !DILocation(line: 35, column: 41, scope: !33)
!38 = !DILocation(line: 35, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !33, file: !19, line: 36, type: !5)
!40 = !DILocation(line: 36, column: 16, scope: !33)
!41 = !DILocation(line: 36, column: 31, scope: !33)
!42 = !DILocation(line: 37, column: 22, scope: !33)
!43 = !DILocation(line: 37, column: 28, scope: !33)
!44 = !DILocation(line: 37, column: 15, scope: !33)
!45 = !DILocation(line: 38, column: 27, scope: !33)
!46 = !DILocation(line: 38, column: 9, scope: !33)
!47 = !DILocation(line: 40, column: 1, scope: !18)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_64b_goodG2BSink", scope: !19, file: !19, line: 47, type: !20, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !48, file: !19, line: 47, type: !5)
!50 = !DILocation(line: 47, column: 72, scope: !48)
!51 = !DILocalVariable(name: "dataPtr", scope: !48, file: !19, line: 50, type: !4)
!52 = !DILocation(line: 50, column: 14, scope: !48)
!53 = !DILocation(line: 50, column: 34, scope: !48)
!54 = !DILocation(line: 50, column: 24, scope: !48)
!55 = !DILocalVariable(name: "data", scope: !48, file: !19, line: 52, type: !5)
!56 = !DILocation(line: 52, column: 12, scope: !48)
!57 = !DILocation(line: 52, column: 21, scope: !48)
!58 = !DILocation(line: 52, column: 20, scope: !48)
!59 = !DILocalVariable(name: "dataLen", scope: !60, file: !19, line: 55, type: !34)
!60 = distinct !DILexicalBlock(scope: !48, file: !19, line: 53, column: 5)
!61 = !DILocation(line: 55, column: 16, scope: !60)
!62 = !DILocation(line: 55, column: 41, scope: !60)
!63 = !DILocation(line: 55, column: 26, scope: !60)
!64 = !DILocalVariable(name: "dest", scope: !60, file: !19, line: 56, type: !5)
!65 = !DILocation(line: 56, column: 16, scope: !60)
!66 = !DILocation(line: 56, column: 31, scope: !60)
!67 = !DILocation(line: 57, column: 22, scope: !60)
!68 = !DILocation(line: 57, column: 28, scope: !60)
!69 = !DILocation(line: 57, column: 15, scope: !60)
!70 = !DILocation(line: 58, column: 27, scope: !60)
!71 = !DILocation(line: 58, column: 9, scope: !60)
!72 = !DILocation(line: 60, column: 1, scope: !48)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_64b_goodB2GSink", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !73, file: !19, line: 63, type: !5)
!75 = !DILocation(line: 63, column: 72, scope: !73)
!76 = !DILocalVariable(name: "dataPtr", scope: !73, file: !19, line: 66, type: !4)
!77 = !DILocation(line: 66, column: 14, scope: !73)
!78 = !DILocation(line: 66, column: 34, scope: !73)
!79 = !DILocation(line: 66, column: 24, scope: !73)
!80 = !DILocalVariable(name: "data", scope: !73, file: !19, line: 68, type: !5)
!81 = !DILocation(line: 68, column: 12, scope: !73)
!82 = !DILocation(line: 68, column: 21, scope: !73)
!83 = !DILocation(line: 68, column: 20, scope: !73)
!84 = !DILocalVariable(name: "dataLen", scope: !85, file: !19, line: 71, type: !34)
!85 = distinct !DILexicalBlock(scope: !73, file: !19, line: 69, column: 5)
!86 = !DILocation(line: 71, column: 16, scope: !85)
!87 = !DILocation(line: 71, column: 44, scope: !85)
!88 = !DILocation(line: 71, column: 33, scope: !85)
!89 = !DILocation(line: 71, column: 26, scope: !85)
!90 = !DILocalVariable(name: "dest", scope: !85, file: !19, line: 72, type: !5)
!91 = !DILocation(line: 72, column: 16, scope: !85)
!92 = !DILocation(line: 72, column: 31, scope: !85)
!93 = !DILocation(line: 73, column: 22, scope: !85)
!94 = !DILocation(line: 73, column: 28, scope: !85)
!95 = !DILocation(line: 73, column: 15, scope: !85)
!96 = !DILocation(line: 74, column: 31, scope: !85)
!97 = !DILocation(line: 74, column: 20, scope: !85)
!98 = !DILocation(line: 74, column: 9, scope: !85)
!99 = !DILocation(line: 76, column: 1, scope: !73)
