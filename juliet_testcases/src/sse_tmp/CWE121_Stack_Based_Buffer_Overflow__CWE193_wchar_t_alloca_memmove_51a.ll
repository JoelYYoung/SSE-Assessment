; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %data, align 8, !dbg !33
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51b_badSink(i32* %6), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51_bad(), !dbg !56
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
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = alloca i8, i64 40, align 16, !dbg !64
  %1 = bitcast i8* %0 to i32*, !dbg !65
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %2 = alloca i8, i64 44, align 16, !dbg !68
  %3 = bitcast i8* %2 to i32*, !dbg !69
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !67
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !70
  store i32* %4, i32** %data, align 8, !dbg !71
  %5 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  %6 = load i32*, i32** %data, align 8, !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51b_goodG2BSink(i32* %6), !dbg !75
  ret void, !dbg !76
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 34, type: !4)
!22 = !DILocation(line: 34, column: 15, scope: !15)
!23 = !DILocation(line: 34, column: 42, scope: !15)
!24 = !DILocation(line: 34, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 35, type: !4)
!26 = !DILocation(line: 35, column: 15, scope: !15)
!27 = !DILocation(line: 35, column: 43, scope: !15)
!28 = !DILocation(line: 35, column: 32, scope: !15)
!29 = !DILocation(line: 38, column: 12, scope: !15)
!30 = !DILocation(line: 38, column: 10, scope: !15)
!31 = !DILocation(line: 39, column: 5, scope: !15)
!32 = !DILocation(line: 39, column: 13, scope: !15)
!33 = !DILocation(line: 40, column: 83, scope: !15)
!34 = !DILocation(line: 40, column: 5, scope: !15)
!35 = !DILocation(line: 41, column: 1, scope: !15)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_51_good", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 65, column: 5, scope: !36)
!38 = !DILocation(line: 66, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 78, type: !40, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!7, !7, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !16, line: 78, type: !7)
!46 = !DILocation(line: 78, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !16, line: 78, type: !42)
!48 = !DILocation(line: 78, column: 27, scope: !39)
!49 = !DILocation(line: 81, column: 22, scope: !39)
!50 = !DILocation(line: 81, column: 12, scope: !39)
!51 = !DILocation(line: 81, column: 5, scope: !39)
!52 = !DILocation(line: 83, column: 5, scope: !39)
!53 = !DILocation(line: 84, column: 5, scope: !39)
!54 = !DILocation(line: 85, column: 5, scope: !39)
!55 = !DILocation(line: 88, column: 5, scope: !39)
!56 = !DILocation(line: 89, column: 5, scope: !39)
!57 = !DILocation(line: 90, column: 5, scope: !39)
!58 = !DILocation(line: 92, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !16, line: 53, type: !4)
!61 = !DILocation(line: 53, column: 15, scope: !59)
!62 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !16, line: 54, type: !4)
!63 = !DILocation(line: 54, column: 15, scope: !59)
!64 = !DILocation(line: 54, column: 42, scope: !59)
!65 = !DILocation(line: 54, column: 31, scope: !59)
!66 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !16, line: 55, type: !4)
!67 = !DILocation(line: 55, column: 15, scope: !59)
!68 = !DILocation(line: 55, column: 43, scope: !59)
!69 = !DILocation(line: 55, column: 32, scope: !59)
!70 = !DILocation(line: 58, column: 12, scope: !59)
!71 = !DILocation(line: 58, column: 10, scope: !59)
!72 = !DILocation(line: 59, column: 5, scope: !59)
!73 = !DILocation(line: 59, column: 13, scope: !59)
!74 = !DILocation(line: 60, column: 87, scope: !59)
!75 = !DILocation(line: 60, column: 5, scope: !59)
!76 = !DILocation(line: 61, column: 1, scope: !59)
