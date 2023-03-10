; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_63b_badSink(i8** %dataPtr) #0 !dbg !17 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !26
  %1 = load i8*, i8** %0, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i64 @strlen(i8* %2) #5, !dbg !34
  store i64 %call, i64* %dataLen, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !35, metadata !DIExpression()), !dbg !36
  %3 = load i64, i64* %dataLen, align 8, !dbg !37
  %add = add i64 %3, 1, !dbg !37
  %mul = mul i64 %add, 4, !dbg !37
  %4 = alloca i8, i64 %mul, align 16, !dbg !37
  store i8* %4, i8** %dest, align 8, !dbg !36
  %5 = load i8*, i8** %dest, align 8, !dbg !38
  %6 = bitcast i8* %5 to i32*, !dbg !38
  %7 = load i8*, i8** %data, align 8, !dbg !39
  %8 = bitcast i8* %7 to i32*, !dbg !39
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !40
  %9 = load i8*, i8** %dest, align 8, !dbg !41
  call void @printLine(i8* %9), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !44 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !49
  %1 = load i8*, i8** %0, align 8, !dbg !50
  store i8* %1, i8** %data, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !53
  %2 = load i8*, i8** %data, align 8, !dbg !54
  %call = call i64 @strlen(i8* %2) #5, !dbg !55
  store i64 %call, i64* %dataLen, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %3 = load i64, i64* %dataLen, align 8, !dbg !58
  %add = add i64 %3, 1, !dbg !58
  %mul = mul i64 %add, 1, !dbg !58
  %4 = alloca i8, i64 %mul, align 16, !dbg !58
  store i8* %4, i8** %dest, align 8, !dbg !57
  %5 = load i8*, i8** %dest, align 8, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %call1 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !61
  %7 = load i8*, i8** %dest, align 8, !dbg !62
  call void @printLine(i8* %7), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_63b_goodB2GSink(i8** %dataPtr) #0 !dbg !65 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !70
  %1 = load i8*, i8** %0, align 8, !dbg !71
  store i8* %1, i8** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !72, metadata !DIExpression()), !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !75
  %3 = bitcast i8* %2 to i32*, !dbg !76
  %call = call i64 @wcslen(i32* %3) #5, !dbg !77
  store i64 %call, i64* %dataLen, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !78, metadata !DIExpression()), !dbg !79
  %4 = load i64, i64* %dataLen, align 8, !dbg !80
  %add = add i64 %4, 1, !dbg !80
  %mul = mul i64 %add, 4, !dbg !80
  %5 = alloca i8, i64 %mul, align 16, !dbg !80
  store i8* %5, i8** %dest, align 8, !dbg !79
  %6 = load i8*, i8** %dest, align 8, !dbg !81
  %7 = bitcast i8* %6 to i32*, !dbg !81
  %8 = load i8*, i8** %data, align 8, !dbg !82
  %9 = bitcast i8* %8 to i32*, !dbg !82
  %call1 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !83
  %10 = load i8*, i8** %dest, align 8, !dbg !84
  %11 = bitcast i8* %10 to i32*, !dbg !85
  call void @printWLine(i32* %11), !dbg !86
  ret void, !dbg !87
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_63b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_63b_badSink", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_63b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!22 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !17, file: !18, line: 27, type: !21)
!23 = !DILocation(line: 27, column: 70, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 29, type: !6)
!25 = !DILocation(line: 29, column: 12, scope: !17)
!26 = !DILocation(line: 29, column: 20, scope: !17)
!27 = !DILocation(line: 29, column: 19, scope: !17)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !18, line: 32, type: !30)
!29 = distinct !DILexicalBlock(scope: !17, file: !18, line: 30, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 32, column: 16, scope: !29)
!33 = !DILocation(line: 32, column: 41, scope: !29)
!34 = !DILocation(line: 32, column: 26, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !29, file: !18, line: 33, type: !6)
!36 = !DILocation(line: 33, column: 16, scope: !29)
!37 = !DILocation(line: 33, column: 31, scope: !29)
!38 = !DILocation(line: 34, column: 22, scope: !29)
!39 = !DILocation(line: 34, column: 28, scope: !29)
!40 = !DILocation(line: 34, column: 15, scope: !29)
!41 = !DILocation(line: 35, column: 27, scope: !29)
!42 = !DILocation(line: 35, column: 9, scope: !29)
!43 = !DILocation(line: 37, column: 1, scope: !17)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_63b_goodG2BSink", scope: !18, file: !18, line: 44, type: !19, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !44, file: !18, line: 44, type: !21)
!46 = !DILocation(line: 44, column: 74, scope: !44)
!47 = !DILocalVariable(name: "data", scope: !44, file: !18, line: 46, type: !6)
!48 = !DILocation(line: 46, column: 12, scope: !44)
!49 = !DILocation(line: 46, column: 20, scope: !44)
!50 = !DILocation(line: 46, column: 19, scope: !44)
!51 = !DILocalVariable(name: "dataLen", scope: !52, file: !18, line: 49, type: !30)
!52 = distinct !DILexicalBlock(scope: !44, file: !18, line: 47, column: 5)
!53 = !DILocation(line: 49, column: 16, scope: !52)
!54 = !DILocation(line: 49, column: 41, scope: !52)
!55 = !DILocation(line: 49, column: 26, scope: !52)
!56 = !DILocalVariable(name: "dest", scope: !52, file: !18, line: 50, type: !6)
!57 = !DILocation(line: 50, column: 16, scope: !52)
!58 = !DILocation(line: 50, column: 31, scope: !52)
!59 = !DILocation(line: 51, column: 22, scope: !52)
!60 = !DILocation(line: 51, column: 28, scope: !52)
!61 = !DILocation(line: 51, column: 15, scope: !52)
!62 = !DILocation(line: 52, column: 27, scope: !52)
!63 = !DILocation(line: 52, column: 9, scope: !52)
!64 = !DILocation(line: 54, column: 1, scope: !44)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_63b_goodB2GSink", scope: !18, file: !18, line: 57, type: !19, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !65, file: !18, line: 57, type: !21)
!67 = !DILocation(line: 57, column: 74, scope: !65)
!68 = !DILocalVariable(name: "data", scope: !65, file: !18, line: 59, type: !6)
!69 = !DILocation(line: 59, column: 12, scope: !65)
!70 = !DILocation(line: 59, column: 20, scope: !65)
!71 = !DILocation(line: 59, column: 19, scope: !65)
!72 = !DILocalVariable(name: "dataLen", scope: !73, file: !18, line: 62, type: !30)
!73 = distinct !DILexicalBlock(scope: !65, file: !18, line: 60, column: 5)
!74 = !DILocation(line: 62, column: 16, scope: !73)
!75 = !DILocation(line: 62, column: 44, scope: !73)
!76 = !DILocation(line: 62, column: 33, scope: !73)
!77 = !DILocation(line: 62, column: 26, scope: !73)
!78 = !DILocalVariable(name: "dest", scope: !73, file: !18, line: 63, type: !6)
!79 = !DILocation(line: 63, column: 16, scope: !73)
!80 = !DILocation(line: 63, column: 31, scope: !73)
!81 = !DILocation(line: 64, column: 22, scope: !73)
!82 = !DILocation(line: 64, column: 28, scope: !73)
!83 = !DILocation(line: 64, column: 15, scope: !73)
!84 = !DILocation(line: 65, column: 31, scope: !73)
!85 = !DILocation(line: 65, column: 20, scope: !73)
!86 = !DILocation(line: 65, column: 9, scope: !73)
!87 = !DILocation(line: 67, column: 1, scope: !65)
