; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_badSource(i8* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #5, !dbg !35
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %5 = bitcast i32* %4 to i8*, !dbg !39
  store i8* %5, i8** %data.addr, align 8, !dbg !40
  %6 = load i8*, i8** %data.addr, align 8, !dbg !41
  ret i8* %6, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodG2BSource(i8* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !46, metadata !DIExpression()), !dbg !48
  %call = call noalias align 16 i8* @malloc(i64 50) #5, !dbg !49
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !48
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !50
  %cmp = icmp eq i8* %0, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !57
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !58
  store i8 0, i8* %arrayidx, align 1, !dbg !59
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !60
  store i8* %3, i8** %data.addr, align 8, !dbg !61
  %4 = load i8*, i8** %data.addr, align 8, !dbg !62
  ret i8* %4, !dbg !63
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodB2GSource(i8* %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !70
  %0 = bitcast i8* %call to i32*, !dbg !71
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !69
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !72
  %cmp = icmp eq i32* %1, null, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !78
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #5, !dbg !79
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !82
  %5 = bitcast i32* %4 to i8*, !dbg !83
  store i8* %5, i8** %data.addr, align 8, !dbg !84
  %6 = load i8*, i8** %data.addr, align 8, !dbg !85
  ret i8* %6, !dbg !86
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_badSource", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{!8, !8}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 24, type: !8)
!22 = !DILocation(line: 24, column: 71, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !24, file: !18, line: 27, type: !4)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 5)
!25 = !DILocation(line: 27, column: 19, scope: !24)
!26 = !DILocation(line: 27, column: 46, scope: !24)
!27 = !DILocation(line: 27, column: 35, scope: !24)
!28 = !DILocation(line: 28, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !18, line: 28, column: 13)
!30 = !DILocation(line: 28, column: 27, scope: !29)
!31 = !DILocation(line: 28, column: 13, scope: !24)
!32 = !DILocation(line: 28, column: 37, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !18, line: 28, column: 36)
!34 = !DILocation(line: 29, column: 17, scope: !24)
!35 = !DILocation(line: 29, column: 9, scope: !24)
!36 = !DILocation(line: 30, column: 9, scope: !24)
!37 = !DILocation(line: 30, column: 29, scope: !24)
!38 = !DILocation(line: 32, column: 24, scope: !24)
!39 = !DILocation(line: 32, column: 16, scope: !24)
!40 = !DILocation(line: 32, column: 14, scope: !24)
!41 = !DILocation(line: 34, column: 12, scope: !17)
!42 = !DILocation(line: 34, column: 5, scope: !17)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodG2BSource", scope: !18, file: !18, line: 42, type: !19, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !18, line: 42, type: !8)
!45 = !DILocation(line: 42, column: 75, scope: !43)
!46 = !DILocalVariable(name: "dataGoodBuffer", scope: !47, file: !18, line: 45, type: !9)
!47 = distinct !DILexicalBlock(scope: !43, file: !18, line: 44, column: 5)
!48 = !DILocation(line: 45, column: 16, scope: !47)
!49 = !DILocation(line: 45, column: 41, scope: !47)
!50 = !DILocation(line: 46, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !18, line: 46, column: 13)
!52 = !DILocation(line: 46, column: 28, scope: !51)
!53 = !DILocation(line: 46, column: 13, scope: !47)
!54 = !DILocation(line: 46, column: 38, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !18, line: 46, column: 37)
!56 = !DILocation(line: 47, column: 16, scope: !47)
!57 = !DILocation(line: 47, column: 9, scope: !47)
!58 = !DILocation(line: 48, column: 9, scope: !47)
!59 = !DILocation(line: 48, column: 30, scope: !47)
!60 = !DILocation(line: 50, column: 24, scope: !47)
!61 = !DILocation(line: 50, column: 14, scope: !47)
!62 = !DILocation(line: 52, column: 12, scope: !43)
!63 = !DILocation(line: 52, column: 5, scope: !43)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodB2GSource", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !18, line: 56, type: !8)
!66 = !DILocation(line: 56, column: 75, scope: !64)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !18, line: 59, type: !4)
!68 = distinct !DILexicalBlock(scope: !64, file: !18, line: 58, column: 5)
!69 = !DILocation(line: 59, column: 19, scope: !68)
!70 = !DILocation(line: 59, column: 46, scope: !68)
!71 = !DILocation(line: 59, column: 35, scope: !68)
!72 = !DILocation(line: 60, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !18, line: 60, column: 13)
!74 = !DILocation(line: 60, column: 27, scope: !73)
!75 = !DILocation(line: 60, column: 13, scope: !68)
!76 = !DILocation(line: 60, column: 37, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !18, line: 60, column: 36)
!78 = !DILocation(line: 61, column: 17, scope: !68)
!79 = !DILocation(line: 61, column: 9, scope: !68)
!80 = !DILocation(line: 62, column: 9, scope: !68)
!81 = !DILocation(line: 62, column: 29, scope: !68)
!82 = !DILocation(line: 64, column: 24, scope: !68)
!83 = !DILocation(line: 64, column: 16, scope: !68)
!84 = !DILocation(line: 64, column: 14, scope: !68)
!85 = !DILocation(line: 66, column: 12, scope: !64)
!86 = !DILocation(line: 66, column: 5, scope: !64)
