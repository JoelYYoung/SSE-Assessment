; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_65b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_65b_badSink(i8* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = load i8*, i8** %data.addr, align 8, !dbg !28
  %call = call i64 @strlen(i8* %0) #5, !dbg !29
  store i64 %call, i64* %dataLen, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i64, i64* %dataLen, align 8, !dbg !32
  %add = add i64 %1, 1, !dbg !32
  %mul = mul i64 %add, 4, !dbg !32
  %2 = alloca i8, i64 %mul, align 16, !dbg !32
  store i8* %2, i8** %dest, align 8, !dbg !31
  %3 = load i8*, i8** %dest, align 8, !dbg !33
  %4 = bitcast i8* %3 to i32*, !dbg !33
  %5 = load i8*, i8** %data.addr, align 8, !dbg !34
  %6 = bitcast i8* %5 to i32*, !dbg !34
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !35
  %7 = load i8*, i8** %dest, align 8, !dbg !36
  call void @printLine(i8* %7), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_65b_goodG2BSink(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !42, metadata !DIExpression()), !dbg !44
  %0 = load i8*, i8** %data.addr, align 8, !dbg !45
  %call = call i64 @strlen(i8* %0) #5, !dbg !46
  store i64 %call, i64* %dataLen, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !47, metadata !DIExpression()), !dbg !48
  %1 = load i64, i64* %dataLen, align 8, !dbg !49
  %add = add i64 %1, 1, !dbg !49
  %mul = mul i64 %add, 1, !dbg !49
  %2 = alloca i8, i64 %mul, align 16, !dbg !49
  store i8* %2, i8** %dest, align 8, !dbg !48
  %3 = load i8*, i8** %dest, align 8, !dbg !50
  %4 = load i8*, i8** %data.addr, align 8, !dbg !51
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !52
  %5 = load i8*, i8** %dest, align 8, !dbg !53
  call void @printLine(i8* %5), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_65b_goodB2GSink(i8* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** %data.addr, align 8, !dbg !62
  %1 = bitcast i8* %0 to i32*, !dbg !63
  %call = call i64 @wcslen(i32* %1) #5, !dbg !64
  store i64 %call, i64* %dataLen, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !65, metadata !DIExpression()), !dbg !66
  %2 = load i64, i64* %dataLen, align 8, !dbg !67
  %add = add i64 %2, 1, !dbg !67
  %mul = mul i64 %add, 4, !dbg !67
  %3 = alloca i8, i64 %mul, align 16, !dbg !67
  store i8* %3, i8** %dest, align 8, !dbg !66
  %4 = load i8*, i8** %dest, align 8, !dbg !68
  %5 = bitcast i8* %4 to i32*, !dbg !68
  %6 = load i8*, i8** %data.addr, align 8, !dbg !69
  %7 = bitcast i8* %6 to i32*, !dbg !69
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !70
  %8 = load i8*, i8** %dest, align 8, !dbg !71
  %9 = bitcast i8* %8 to i32*, !dbg !72
  call void @printWLine(i32* %9), !dbg !73
  ret void, !dbg !74
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_65b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_65b_badSink", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_65b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !6}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 27, type: !6)
!22 = !DILocation(line: 27, column: 68, scope: !17)
!23 = !DILocalVariable(name: "dataLen", scope: !24, file: !18, line: 31, type: !25)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !26)
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 31, column: 16, scope: !24)
!28 = !DILocation(line: 31, column: 41, scope: !24)
!29 = !DILocation(line: 31, column: 26, scope: !24)
!30 = !DILocalVariable(name: "dest", scope: !24, file: !18, line: 32, type: !6)
!31 = !DILocation(line: 32, column: 16, scope: !24)
!32 = !DILocation(line: 32, column: 31, scope: !24)
!33 = !DILocation(line: 33, column: 22, scope: !24)
!34 = !DILocation(line: 33, column: 28, scope: !24)
!35 = !DILocation(line: 33, column: 15, scope: !24)
!36 = !DILocation(line: 34, column: 27, scope: !24)
!37 = !DILocation(line: 34, column: 9, scope: !24)
!38 = !DILocation(line: 36, column: 1, scope: !17)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_65b_goodG2BSink", scope: !18, file: !18, line: 43, type: !19, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !18, line: 43, type: !6)
!41 = !DILocation(line: 43, column: 72, scope: !39)
!42 = !DILocalVariable(name: "dataLen", scope: !43, file: !18, line: 47, type: !25)
!43 = distinct !DILexicalBlock(scope: !39, file: !18, line: 45, column: 5)
!44 = !DILocation(line: 47, column: 16, scope: !43)
!45 = !DILocation(line: 47, column: 41, scope: !43)
!46 = !DILocation(line: 47, column: 26, scope: !43)
!47 = !DILocalVariable(name: "dest", scope: !43, file: !18, line: 48, type: !6)
!48 = !DILocation(line: 48, column: 16, scope: !43)
!49 = !DILocation(line: 48, column: 31, scope: !43)
!50 = !DILocation(line: 49, column: 22, scope: !43)
!51 = !DILocation(line: 49, column: 28, scope: !43)
!52 = !DILocation(line: 49, column: 15, scope: !43)
!53 = !DILocation(line: 50, column: 27, scope: !43)
!54 = !DILocation(line: 50, column: 9, scope: !43)
!55 = !DILocation(line: 52, column: 1, scope: !39)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_65b_goodB2GSink", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !18, line: 55, type: !6)
!58 = !DILocation(line: 55, column: 72, scope: !56)
!59 = !DILocalVariable(name: "dataLen", scope: !60, file: !18, line: 59, type: !25)
!60 = distinct !DILexicalBlock(scope: !56, file: !18, line: 57, column: 5)
!61 = !DILocation(line: 59, column: 16, scope: !60)
!62 = !DILocation(line: 59, column: 44, scope: !60)
!63 = !DILocation(line: 59, column: 33, scope: !60)
!64 = !DILocation(line: 59, column: 26, scope: !60)
!65 = !DILocalVariable(name: "dest", scope: !60, file: !18, line: 60, type: !6)
!66 = !DILocation(line: 60, column: 16, scope: !60)
!67 = !DILocation(line: 60, column: 31, scope: !60)
!68 = !DILocation(line: 61, column: 22, scope: !60)
!69 = !DILocation(line: 61, column: 28, scope: !60)
!70 = !DILocation(line: 61, column: 15, scope: !60)
!71 = !DILocation(line: 62, column: 31, scope: !60)
!72 = !DILocation(line: 62, column: 20, scope: !60)
!73 = !DILocation(line: 62, column: 9, scope: !60)
!74 = !DILocation(line: 64, column: 1, scope: !56)
