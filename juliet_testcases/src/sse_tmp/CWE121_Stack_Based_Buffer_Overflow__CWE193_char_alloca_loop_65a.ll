; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65b_badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65b_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #4, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #4, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !62, metadata !DIExpression()), !dbg !63
  store void (i8*)* @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65b_goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = alloca i8, i64 10, align 16, !dbg !66
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %1 = alloca i8, i64 11, align 16, !dbg !69
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !68
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !70
  store i8* %2, i8** %data, align 8, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !74
  %5 = load i8*, i8** %data, align 8, !dbg !75
  call void %4(i8* %5), !dbg !74
  ret void, !dbg !76
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 35, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 35, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 36, type: !4)
!25 = !DILocation(line: 36, column: 12, scope: !13)
!26 = !DILocation(line: 36, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 37, type: !4)
!28 = !DILocation(line: 37, column: 12, scope: !13)
!29 = !DILocation(line: 37, column: 37, scope: !13)
!30 = !DILocation(line: 40, column: 12, scope: !13)
!31 = !DILocation(line: 40, column: 10, scope: !13)
!32 = !DILocation(line: 41, column: 5, scope: !13)
!33 = !DILocation(line: 41, column: 13, scope: !13)
!34 = !DILocation(line: 43, column: 5, scope: !13)
!35 = !DILocation(line: 43, column: 13, scope: !13)
!36 = !DILocation(line: 44, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_65_good", scope: !14, file: !14, line: 66, type: !15, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 68, column: 5, scope: !37)
!39 = !DILocation(line: 69, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 81, type: !41, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !14, line: 81, type: !43)
!46 = !DILocation(line: 81, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !14, line: 81, type: !44)
!48 = !DILocation(line: 81, column: 27, scope: !40)
!49 = !DILocation(line: 84, column: 22, scope: !40)
!50 = !DILocation(line: 84, column: 12, scope: !40)
!51 = !DILocation(line: 84, column: 5, scope: !40)
!52 = !DILocation(line: 86, column: 5, scope: !40)
!53 = !DILocation(line: 87, column: 5, scope: !40)
!54 = !DILocation(line: 88, column: 5, scope: !40)
!55 = !DILocation(line: 91, column: 5, scope: !40)
!56 = !DILocation(line: 92, column: 5, scope: !40)
!57 = !DILocation(line: 93, column: 5, scope: !40)
!58 = !DILocation(line: 95, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !14, line: 55, type: !4)
!61 = !DILocation(line: 55, column: 12, scope: !59)
!62 = !DILocalVariable(name: "funcPtr", scope: !59, file: !14, line: 56, type: !20)
!63 = !DILocation(line: 56, column: 12, scope: !59)
!64 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !14, line: 57, type: !4)
!65 = !DILocation(line: 57, column: 12, scope: !59)
!66 = !DILocation(line: 57, column: 36, scope: !59)
!67 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !14, line: 58, type: !4)
!68 = !DILocation(line: 58, column: 12, scope: !59)
!69 = !DILocation(line: 58, column: 37, scope: !59)
!70 = !DILocation(line: 61, column: 12, scope: !59)
!71 = !DILocation(line: 61, column: 10, scope: !59)
!72 = !DILocation(line: 62, column: 5, scope: !59)
!73 = !DILocation(line: 62, column: 13, scope: !59)
!74 = !DILocation(line: 63, column: 5, scope: !59)
!75 = !DILocation(line: 63, column: 13, scope: !59)
!76 = !DILocation(line: 64, column: 1, scope: !59)
