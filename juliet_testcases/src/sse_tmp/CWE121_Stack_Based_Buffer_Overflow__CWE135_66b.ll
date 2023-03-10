; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_66b_badSink(i8** %dataArray) #0 !dbg !17 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !26
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !26
  store i8* %1, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !27, metadata !DIExpression()), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %call = call i64 @strlen(i8* %2) #5, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i64, i64* %dataLen, align 8, !dbg !36
  %add = add i64 %3, 1, !dbg !36
  %mul = mul i64 %add, 4, !dbg !36
  %4 = alloca i8, i64 %mul, align 16, !dbg !36
  store i8* %4, i8** %dest, align 8, !dbg !35
  %5 = load i8*, i8** %dest, align 8, !dbg !37
  %6 = bitcast i8* %5 to i32*, !dbg !37
  %7 = load i8*, i8** %data, align 8, !dbg !38
  %8 = bitcast i8* %7 to i32*, !dbg !38
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !39
  %9 = load i8*, i8** %dest, align 8, !dbg !40
  call void @printLine(i8* %9), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_66b_goodG2BSink(i8** %dataArray) #0 !dbg !43 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !48
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !48
  store i8* %1, i8** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !51
  %2 = load i8*, i8** %data, align 8, !dbg !52
  %call = call i64 @strlen(i8* %2) #5, !dbg !53
  store i64 %call, i64* %dataLen, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !54, metadata !DIExpression()), !dbg !55
  %3 = load i64, i64* %dataLen, align 8, !dbg !56
  %add = add i64 %3, 1, !dbg !56
  %mul = mul i64 %add, 1, !dbg !56
  %4 = alloca i8, i64 %mul, align 16, !dbg !56
  store i8* %4, i8** %dest, align 8, !dbg !55
  %5 = load i8*, i8** %dest, align 8, !dbg !57
  %6 = load i8*, i8** %data, align 8, !dbg !58
  %call1 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !59
  %7 = load i8*, i8** %dest, align 8, !dbg !60
  call void @printLine(i8* %7), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_66b_goodB2GSink(i8** %dataArray) #0 !dbg !63 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !68
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !68
  store i8* %1, i8** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !69, metadata !DIExpression()), !dbg !71
  %2 = load i8*, i8** %data, align 8, !dbg !72
  %3 = bitcast i8* %2 to i32*, !dbg !73
  %call = call i64 @wcslen(i32* %3) #5, !dbg !74
  store i64 %call, i64* %dataLen, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !75, metadata !DIExpression()), !dbg !76
  %4 = load i64, i64* %dataLen, align 8, !dbg !77
  %add = add i64 %4, 1, !dbg !77
  %mul = mul i64 %add, 4, !dbg !77
  %5 = alloca i8, i64 %mul, align 16, !dbg !77
  store i8* %5, i8** %dest, align 8, !dbg !76
  %6 = load i8*, i8** %dest, align 8, !dbg !78
  %7 = bitcast i8* %6 to i32*, !dbg !78
  %8 = load i8*, i8** %data, align 8, !dbg !79
  %9 = bitcast i8* %8 to i32*, !dbg !79
  %call1 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !80
  %10 = load i8*, i8** %dest, align 8, !dbg !81
  %11 = bitcast i8* %10 to i32*, !dbg !82
  call void @printWLine(i32* %11), !dbg !83
  ret void, !dbg !84
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_66b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_66b_badSink", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_66b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!22 = !DILocalVariable(name: "dataArray", arg: 1, scope: !17, file: !18, line: 27, type: !21)
!23 = !DILocation(line: 27, column: 68, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 30, type: !6)
!25 = !DILocation(line: 30, column: 12, scope: !17)
!26 = !DILocation(line: 30, column: 19, scope: !17)
!27 = !DILocalVariable(name: "dataLen", scope: !28, file: !18, line: 33, type: !29)
!28 = distinct !DILexicalBlock(scope: !17, file: !18, line: 31, column: 5)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !30)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 33, column: 16, scope: !28)
!32 = !DILocation(line: 33, column: 41, scope: !28)
!33 = !DILocation(line: 33, column: 26, scope: !28)
!34 = !DILocalVariable(name: "dest", scope: !28, file: !18, line: 34, type: !6)
!35 = !DILocation(line: 34, column: 16, scope: !28)
!36 = !DILocation(line: 34, column: 31, scope: !28)
!37 = !DILocation(line: 35, column: 22, scope: !28)
!38 = !DILocation(line: 35, column: 28, scope: !28)
!39 = !DILocation(line: 35, column: 15, scope: !28)
!40 = !DILocation(line: 36, column: 27, scope: !28)
!41 = !DILocation(line: 36, column: 9, scope: !28)
!42 = !DILocation(line: 38, column: 1, scope: !17)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_66b_goodG2BSink", scope: !18, file: !18, line: 45, type: !19, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "dataArray", arg: 1, scope: !43, file: !18, line: 45, type: !21)
!45 = !DILocation(line: 45, column: 72, scope: !43)
!46 = !DILocalVariable(name: "data", scope: !43, file: !18, line: 47, type: !6)
!47 = !DILocation(line: 47, column: 12, scope: !43)
!48 = !DILocation(line: 47, column: 19, scope: !43)
!49 = !DILocalVariable(name: "dataLen", scope: !50, file: !18, line: 50, type: !29)
!50 = distinct !DILexicalBlock(scope: !43, file: !18, line: 48, column: 5)
!51 = !DILocation(line: 50, column: 16, scope: !50)
!52 = !DILocation(line: 50, column: 41, scope: !50)
!53 = !DILocation(line: 50, column: 26, scope: !50)
!54 = !DILocalVariable(name: "dest", scope: !50, file: !18, line: 51, type: !6)
!55 = !DILocation(line: 51, column: 16, scope: !50)
!56 = !DILocation(line: 51, column: 31, scope: !50)
!57 = !DILocation(line: 52, column: 22, scope: !50)
!58 = !DILocation(line: 52, column: 28, scope: !50)
!59 = !DILocation(line: 52, column: 15, scope: !50)
!60 = !DILocation(line: 53, column: 27, scope: !50)
!61 = !DILocation(line: 53, column: 9, scope: !50)
!62 = !DILocation(line: 55, column: 1, scope: !43)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_66b_goodB2GSink", scope: !18, file: !18, line: 58, type: !19, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "dataArray", arg: 1, scope: !63, file: !18, line: 58, type: !21)
!65 = !DILocation(line: 58, column: 72, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !18, line: 60, type: !6)
!67 = !DILocation(line: 60, column: 12, scope: !63)
!68 = !DILocation(line: 60, column: 19, scope: !63)
!69 = !DILocalVariable(name: "dataLen", scope: !70, file: !18, line: 63, type: !29)
!70 = distinct !DILexicalBlock(scope: !63, file: !18, line: 61, column: 5)
!71 = !DILocation(line: 63, column: 16, scope: !70)
!72 = !DILocation(line: 63, column: 44, scope: !70)
!73 = !DILocation(line: 63, column: 33, scope: !70)
!74 = !DILocation(line: 63, column: 26, scope: !70)
!75 = !DILocalVariable(name: "dest", scope: !70, file: !18, line: 64, type: !6)
!76 = !DILocation(line: 64, column: 16, scope: !70)
!77 = !DILocation(line: 64, column: 31, scope: !70)
!78 = !DILocation(line: 65, column: 22, scope: !70)
!79 = !DILocation(line: 65, column: 28, scope: !70)
!80 = !DILocation(line: 65, column: 15, scope: !70)
!81 = !DILocation(line: 66, column: 31, scope: !70)
!82 = !DILocation(line: 66, column: 20, scope: !70)
!83 = !DILocation(line: 66, column: 9, scope: !70)
!84 = !DILocation(line: 68, column: 1, scope: !63)
