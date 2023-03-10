; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63b_badSink(i8** %data), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63b_badSink(i8**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63_good() #0 !dbg !31 {
entry:
  call void @goodG2B(), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call i64 @time(i64* null) #4, !dbg !43
  %conv = trunc i64 %call to i32, !dbg !44
  call void @srand(i32 %conv) #4, !dbg !45
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !46
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63_good(), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63_bad(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = alloca i8, i64 50, align 16, !dbg !58
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !59, metadata !DIExpression()), !dbg !60
  %1 = alloca i8, i64 100, align 16, !dbg !61
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !60
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !62
  store i8* %2, i8** %data, align 8, !dbg !63
  %3 = load i8*, i8** %data, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !64
  store i8 0, i8* %arrayidx, align 1, !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63b_goodG2BSink(i8** %data), !dbg !66
  ret void, !dbg !67
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63b_goodG2BSink(i8**) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 12, scope: !13)
!21 = !DILocation(line: 29, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 30, type: !4)
!23 = !DILocation(line: 30, column: 12, scope: !13)
!24 = !DILocation(line: 30, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 10, scope: !13)
!27 = !DILocation(line: 34, column: 5, scope: !13)
!28 = !DILocation(line: 34, column: 13, scope: !13)
!29 = !DILocation(line: 35, column: 5, scope: !13)
!30 = !DILocation(line: 36, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_63_good", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 58, column: 5, scope: !31)
!33 = !DILocation(line: 59, column: 1, scope: !31)
!34 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 71, type: !35, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!37, !37, !38}
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!39 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !14, line: 71, type: !37)
!40 = !DILocation(line: 71, column: 14, scope: !34)
!41 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !14, line: 71, type: !38)
!42 = !DILocation(line: 71, column: 27, scope: !34)
!43 = !DILocation(line: 74, column: 22, scope: !34)
!44 = !DILocation(line: 74, column: 12, scope: !34)
!45 = !DILocation(line: 74, column: 5, scope: !34)
!46 = !DILocation(line: 76, column: 5, scope: !34)
!47 = !DILocation(line: 77, column: 5, scope: !34)
!48 = !DILocation(line: 78, column: 5, scope: !34)
!49 = !DILocation(line: 81, column: 5, scope: !34)
!50 = !DILocation(line: 82, column: 5, scope: !34)
!51 = !DILocation(line: 83, column: 5, scope: !34)
!52 = !DILocation(line: 85, column: 5, scope: !34)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", scope: !53, file: !14, line: 47, type: !4)
!55 = !DILocation(line: 47, column: 12, scope: !53)
!56 = !DILocalVariable(name: "dataBadBuffer", scope: !53, file: !14, line: 48, type: !4)
!57 = !DILocation(line: 48, column: 12, scope: !53)
!58 = !DILocation(line: 48, column: 36, scope: !53)
!59 = !DILocalVariable(name: "dataGoodBuffer", scope: !53, file: !14, line: 49, type: !4)
!60 = !DILocation(line: 49, column: 12, scope: !53)
!61 = !DILocation(line: 49, column: 37, scope: !53)
!62 = !DILocation(line: 51, column: 12, scope: !53)
!63 = !DILocation(line: 51, column: 10, scope: !53)
!64 = !DILocation(line: 52, column: 5, scope: !53)
!65 = !DILocation(line: 52, column: 13, scope: !53)
!66 = !DILocation(line: 53, column: 5, scope: !53)
!67 = !DILocation(line: 54, column: 1, scope: !53)
