; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_badGlobal = external dso_local global i32, align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_badSource(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !22
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !24
  %2 = load i32*, i32** %data.addr, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !25
  store i32 0, i32* %arrayidx, align 4, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !28
  ret i32* %3, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B1Source(i32* %data) #0 !dbg !30 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B1Global, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !36
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !39
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #4, !dbg !41
  %2 = load i32*, i32** %data.addr, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !44
  ret i32* %3, !dbg !45
}

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B2Source(i32* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B2Global, align 4, !dbg !49
  %tobool = icmp ne i32 %0, 0, !dbg !49
  br i1 %tobool, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #4, !dbg !54
  %2 = load i32*, i32** %data.addr, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  br label %if.end, !dbg !57

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !58
  ret i32* %3, !dbg !59
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_badSource", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!18 = !DILocation(line: 26, column: 97, scope: !9)
!19 = !DILocation(line: 28, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 28, column: 8)
!21 = !DILocation(line: 28, column: 8, scope: !9)
!22 = !DILocation(line: 31, column: 17, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !10, line: 29, column: 5)
!24 = !DILocation(line: 31, column: 9, scope: !23)
!25 = !DILocation(line: 32, column: 9, scope: !23)
!26 = !DILocation(line: 32, column: 21, scope: !23)
!27 = !DILocation(line: 33, column: 5, scope: !23)
!28 = !DILocation(line: 34, column: 12, scope: !9)
!29 = !DILocation(line: 34, column: 5, scope: !9)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B1Source", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "data", arg: 1, scope: !30, file: !10, line: 46, type: !13)
!32 = !DILocation(line: 46, column: 102, scope: !30)
!33 = !DILocation(line: 48, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 48, column: 8)
!35 = !DILocation(line: 48, column: 8, scope: !30)
!36 = !DILocation(line: 51, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 49, column: 5)
!38 = !DILocation(line: 52, column: 5, scope: !37)
!39 = !DILocation(line: 56, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !10, line: 54, column: 5)
!41 = !DILocation(line: 56, column: 9, scope: !40)
!42 = !DILocation(line: 57, column: 9, scope: !40)
!43 = !DILocation(line: 57, column: 20, scope: !40)
!44 = !DILocation(line: 59, column: 12, scope: !30)
!45 = !DILocation(line: 59, column: 5, scope: !30)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_22_goodG2B2Source", scope: !10, file: !10, line: 63, type: !11, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !10, line: 63, type: !13)
!48 = !DILocation(line: 63, column: 102, scope: !46)
!49 = !DILocation(line: 65, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !10, line: 65, column: 8)
!51 = !DILocation(line: 65, column: 8, scope: !46)
!52 = !DILocation(line: 68, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !10, line: 66, column: 5)
!54 = !DILocation(line: 68, column: 9, scope: !53)
!55 = !DILocation(line: 69, column: 9, scope: !53)
!56 = !DILocation(line: 69, column: 20, scope: !53)
!57 = !DILocation(line: 70, column: 5, scope: !53)
!58 = !DILocation(line: 71, column: 12, scope: !46)
!59 = !DILocation(line: 71, column: 5, scope: !46)
