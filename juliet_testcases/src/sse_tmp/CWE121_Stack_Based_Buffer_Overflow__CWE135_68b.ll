; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE135_68_badData = external dso_local global i8*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodG2BData = external dso_local global i8*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodB2GData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_badSink() #0 !dbg !17 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_badData, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !24, metadata !DIExpression()), !dbg !28
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i64 @strlen(i8* %1) #5, !dbg !30
  store i64 %call, i64* %dataLen, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = load i64, i64* %dataLen, align 8, !dbg !33
  %add = add i64 %2, 1, !dbg !33
  %mul = mul i64 %add, 4, !dbg !33
  %3 = alloca i8, i64 %mul, align 16, !dbg !33
  store i8* %3, i8** %dest, align 8, !dbg !32
  %4 = load i8*, i8** %dest, align 8, !dbg !34
  %5 = bitcast i8* %4 to i32*, !dbg !34
  %6 = load i8*, i8** %data, align 8, !dbg !35
  %7 = bitcast i8* %6 to i32*, !dbg !35
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !36
  %8 = load i8*, i8** %dest, align 8, !dbg !37
  call void @printLine(i8* %8), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodG2BSink() #0 !dbg !40 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodG2BData, align 8, !dbg !43
  store i8* %0, i8** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !46
  %1 = load i8*, i8** %data, align 8, !dbg !47
  %call = call i64 @strlen(i8* %1) #5, !dbg !48
  store i64 %call, i64* %dataLen, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i64, i64* %dataLen, align 8, !dbg !51
  %add = add i64 %2, 1, !dbg !51
  %mul = mul i64 %add, 1, !dbg !51
  %3 = alloca i8, i64 %mul, align 16, !dbg !51
  store i8* %3, i8** %dest, align 8, !dbg !50
  %4 = load i8*, i8** %dest, align 8, !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %call1 = call i8* @strcpy(i8* %4, i8* %5) #6, !dbg !54
  %6 = load i8*, i8** %dest, align 8, !dbg !55
  call void @printLine(i8* %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodB2GSink() #0 !dbg !58 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodB2GData, align 8, !dbg !61
  store i8* %0, i8** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !62, metadata !DIExpression()), !dbg !64
  %1 = load i8*, i8** %data, align 8, !dbg !65
  %2 = bitcast i8* %1 to i32*, !dbg !66
  %call = call i64 @wcslen(i32* %2) #5, !dbg !67
  store i64 %call, i64* %dataLen, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !68, metadata !DIExpression()), !dbg !69
  %3 = load i64, i64* %dataLen, align 8, !dbg !70
  %add = add i64 %3, 1, !dbg !70
  %mul = mul i64 %add, 4, !dbg !70
  %4 = alloca i8, i64 %mul, align 16, !dbg !70
  store i8* %4, i8** %dest, align 8, !dbg !69
  %5 = load i8*, i8** %dest, align 8, !dbg !71
  %6 = bitcast i8* %5 to i32*, !dbg !71
  %7 = load i8*, i8** %data, align 8, !dbg !72
  %8 = bitcast i8* %7 to i32*, !dbg !72
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !73
  %9 = load i8*, i8** %dest, align 8, !dbg !74
  %10 = bitcast i8* %9 to i32*, !dbg !75
  call void @printWLine(i32* %10), !dbg !76
  ret void, !dbg !77
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
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_badSink", scope: !18, file: !18, line: 31, type: !19, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 33, type: !6)
!22 = !DILocation(line: 33, column: 12, scope: !17)
!23 = !DILocation(line: 33, column: 19, scope: !17)
!24 = !DILocalVariable(name: "dataLen", scope: !25, file: !18, line: 36, type: !26)
!25 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !27)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 36, column: 16, scope: !25)
!29 = !DILocation(line: 36, column: 41, scope: !25)
!30 = !DILocation(line: 36, column: 26, scope: !25)
!31 = !DILocalVariable(name: "dest", scope: !25, file: !18, line: 37, type: !6)
!32 = !DILocation(line: 37, column: 16, scope: !25)
!33 = !DILocation(line: 37, column: 31, scope: !25)
!34 = !DILocation(line: 38, column: 22, scope: !25)
!35 = !DILocation(line: 38, column: 28, scope: !25)
!36 = !DILocation(line: 38, column: 15, scope: !25)
!37 = !DILocation(line: 39, column: 27, scope: !25)
!38 = !DILocation(line: 39, column: 9, scope: !25)
!39 = !DILocation(line: 41, column: 1, scope: !17)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodG2BSink", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", scope: !40, file: !18, line: 50, type: !6)
!42 = !DILocation(line: 50, column: 12, scope: !40)
!43 = !DILocation(line: 50, column: 19, scope: !40)
!44 = !DILocalVariable(name: "dataLen", scope: !45, file: !18, line: 53, type: !26)
!45 = distinct !DILexicalBlock(scope: !40, file: !18, line: 51, column: 5)
!46 = !DILocation(line: 53, column: 16, scope: !45)
!47 = !DILocation(line: 53, column: 41, scope: !45)
!48 = !DILocation(line: 53, column: 26, scope: !45)
!49 = !DILocalVariable(name: "dest", scope: !45, file: !18, line: 54, type: !6)
!50 = !DILocation(line: 54, column: 16, scope: !45)
!51 = !DILocation(line: 54, column: 31, scope: !45)
!52 = !DILocation(line: 55, column: 22, scope: !45)
!53 = !DILocation(line: 55, column: 28, scope: !45)
!54 = !DILocation(line: 55, column: 15, scope: !45)
!55 = !DILocation(line: 56, column: 27, scope: !45)
!56 = !DILocation(line: 56, column: 9, scope: !45)
!57 = !DILocation(line: 58, column: 1, scope: !40)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodB2GSink", scope: !18, file: !18, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !18, line: 63, type: !6)
!60 = !DILocation(line: 63, column: 12, scope: !58)
!61 = !DILocation(line: 63, column: 19, scope: !58)
!62 = !DILocalVariable(name: "dataLen", scope: !63, file: !18, line: 66, type: !26)
!63 = distinct !DILexicalBlock(scope: !58, file: !18, line: 64, column: 5)
!64 = !DILocation(line: 66, column: 16, scope: !63)
!65 = !DILocation(line: 66, column: 44, scope: !63)
!66 = !DILocation(line: 66, column: 33, scope: !63)
!67 = !DILocation(line: 66, column: 26, scope: !63)
!68 = !DILocalVariable(name: "dest", scope: !63, file: !18, line: 67, type: !6)
!69 = !DILocation(line: 67, column: 16, scope: !63)
!70 = !DILocation(line: 67, column: 31, scope: !63)
!71 = !DILocation(line: 68, column: 22, scope: !63)
!72 = !DILocation(line: 68, column: 28, scope: !63)
!73 = !DILocation(line: 68, column: 15, scope: !63)
!74 = !DILocation(line: 69, column: 31, scope: !63)
!75 = !DILocation(line: 69, column: 20, scope: !63)
!76 = !DILocation(line: 69, column: 9, scope: !63)
!77 = !DILocation(line: 71, column: 1, scope: !58)
