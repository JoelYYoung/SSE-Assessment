; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %4, i32** %data, align 8, !dbg !28
  %5 = bitcast i32** %data to i8*, !dbg !29
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_badSink(i8* %5), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #4, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #4, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = alloca i8, i64 200, align 16, !dbg !60
  %1 = bitcast i8* %0 to i32*, !dbg !61
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %2 = alloca i8, i64 400, align 16, !dbg !64
  %3 = bitcast i8* %2 to i32*, !dbg !65
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !63
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !66
  store i32* %4, i32** %data, align 8, !dbg !67
  %5 = bitcast i32** %data to i8*, !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_goodG2BSink(i8* %5), !dbg !69
  ret void, !dbg !70
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64_bad", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 27, type: !4)
!20 = !DILocation(line: 27, column: 11, scope: !13)
!21 = !DILocation(line: 27, column: 34, scope: !13)
!22 = !DILocation(line: 27, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 28, type: !4)
!24 = !DILocation(line: 28, column: 11, scope: !13)
!25 = !DILocation(line: 28, column: 35, scope: !13)
!26 = !DILocation(line: 28, column: 28, scope: !13)
!27 = !DILocation(line: 31, column: 12, scope: !13)
!28 = !DILocation(line: 31, column: 10, scope: !13)
!29 = !DILocation(line: 32, column: 76, scope: !13)
!30 = !DILocation(line: 32, column: 5, scope: !13)
!31 = !DILocation(line: 33, column: 1, scope: !13)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64_good", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 54, column: 5, scope: !32)
!34 = !DILocation(line: 55, column: 1, scope: !32)
!35 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 67, type: !36, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!5, !5, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !14, line: 67, type: !5)
!42 = !DILocation(line: 67, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !14, line: 67, type: !38)
!44 = !DILocation(line: 67, column: 27, scope: !35)
!45 = !DILocation(line: 70, column: 22, scope: !35)
!46 = !DILocation(line: 70, column: 12, scope: !35)
!47 = !DILocation(line: 70, column: 5, scope: !35)
!48 = !DILocation(line: 72, column: 5, scope: !35)
!49 = !DILocation(line: 73, column: 5, scope: !35)
!50 = !DILocation(line: 74, column: 5, scope: !35)
!51 = !DILocation(line: 77, column: 5, scope: !35)
!52 = !DILocation(line: 78, column: 5, scope: !35)
!53 = !DILocation(line: 79, column: 5, scope: !35)
!54 = !DILocation(line: 81, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 42, type: !15, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", scope: !55, file: !14, line: 44, type: !4)
!57 = !DILocation(line: 44, column: 11, scope: !55)
!58 = !DILocalVariable(name: "dataBadBuffer", scope: !55, file: !14, line: 45, type: !4)
!59 = !DILocation(line: 45, column: 11, scope: !55)
!60 = !DILocation(line: 45, column: 34, scope: !55)
!61 = !DILocation(line: 45, column: 27, scope: !55)
!62 = !DILocalVariable(name: "dataGoodBuffer", scope: !55, file: !14, line: 46, type: !4)
!63 = !DILocation(line: 46, column: 11, scope: !55)
!64 = !DILocation(line: 46, column: 35, scope: !55)
!65 = !DILocation(line: 46, column: 28, scope: !55)
!66 = !DILocation(line: 48, column: 12, scope: !55)
!67 = !DILocation(line: 48, column: 10, scope: !55)
!68 = !DILocation(line: 49, column: 80, scope: !55)
!69 = !DILocation(line: 49, column: 5, scope: !55)
!70 = !DILocation(line: 50, column: 1, scope: !55)
