; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_badGlobal = external dso_local global i32, align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_badSource(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_badGlobal, align 4, !dbg !17
  %tobool = icmp ne i32 %0, 0, !dbg !17
  br i1 %tobool, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !22
  %2 = load i8*, i8** %data.addr, align 8, !dbg !23
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !23
  store i8 0, i8* %arrayidx, align 1, !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !26
  ret i8* %3, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B1Source(i8* %data) #0 !dbg !28 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B1Global, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !34
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !39
  %2 = load i8*, i8** %data.addr, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !42
  ret i8* %3, !dbg !43
}

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B2Source(i8* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B2Global, align 4, !dbg !47
  %tobool = icmp ne i32 %0, 0, !dbg !47
  br i1 %tobool, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !52
  %2 = load i8*, i8** %data.addr, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !56
  ret i8* %3, !dbg !57
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_badSource", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!16 = !DILocation(line: 26, column: 88, scope: !9)
!17 = !DILocation(line: 28, column: 8, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 28, column: 8)
!19 = !DILocation(line: 28, column: 8, scope: !9)
!20 = !DILocation(line: 31, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !10, line: 29, column: 5)
!22 = !DILocation(line: 31, column: 9, scope: !21)
!23 = !DILocation(line: 32, column: 9, scope: !21)
!24 = !DILocation(line: 32, column: 21, scope: !21)
!25 = !DILocation(line: 33, column: 5, scope: !21)
!26 = !DILocation(line: 34, column: 12, scope: !9)
!27 = !DILocation(line: 34, column: 5, scope: !9)
!28 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B1Source", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "data", arg: 1, scope: !28, file: !10, line: 46, type: !13)
!30 = !DILocation(line: 46, column: 93, scope: !28)
!31 = !DILocation(line: 48, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 48, column: 8)
!33 = !DILocation(line: 48, column: 8, scope: !28)
!34 = !DILocation(line: 51, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !10, line: 49, column: 5)
!36 = !DILocation(line: 52, column: 5, scope: !35)
!37 = !DILocation(line: 56, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !10, line: 54, column: 5)
!39 = !DILocation(line: 56, column: 9, scope: !38)
!40 = !DILocation(line: 57, column: 9, scope: !38)
!41 = !DILocation(line: 57, column: 20, scope: !38)
!42 = !DILocation(line: 59, column: 12, scope: !28)
!43 = !DILocation(line: 59, column: 5, scope: !28)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_22_goodG2B2Source", scope: !10, file: !10, line: 63, type: !11, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !10, line: 63, type: !13)
!46 = !DILocation(line: 63, column: 93, scope: !44)
!47 = !DILocation(line: 65, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !10, line: 65, column: 8)
!49 = !DILocation(line: 65, column: 8, scope: !44)
!50 = !DILocation(line: 68, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 66, column: 5)
!52 = !DILocation(line: 68, column: 9, scope: !51)
!53 = !DILocation(line: 69, column: 9, scope: !51)
!54 = !DILocation(line: 69, column: 20, scope: !51)
!55 = !DILocation(line: 70, column: 5, scope: !51)
!56 = !DILocation(line: 71, column: 12, scope: !44)
!57 = !DILocation(line: 71, column: 5, scope: !44)
