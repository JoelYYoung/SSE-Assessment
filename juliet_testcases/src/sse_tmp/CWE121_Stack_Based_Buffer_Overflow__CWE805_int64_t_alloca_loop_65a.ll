; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65b_badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !36
  store i64* %4, i64** %data, align 8, !dbg !37
  %5 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !38
  %6 = load i64*, i64** %data, align 8, !dbg !39
  call void %5(i64* %6), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65b_badSink(i64*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !68, metadata !DIExpression()), !dbg !69
  store void (i64*)* @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65b_goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 400, align 16, !dbg !72
  %1 = bitcast i8* %0 to i64*, !dbg !73
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %2 = alloca i8, i64 800, align 16, !dbg !76
  %3 = bitcast i8* %2 to i64*, !dbg !77
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !75
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !78
  store i64* %4, i64** %data, align 8, !dbg !79
  %5 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !80
  %6 = load i64*, i64** %data, align 8, !dbg !81
  call void %5(i64* %6), !dbg !80
  ret void, !dbg !82
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65b_goodG2BSink(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65_bad", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !17)
!23 = !DILocalVariable(name: "funcPtr", scope: !17, file: !18, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !4}
!27 = !DILocation(line: 28, column: 12, scope: !17)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 29, type: !4)
!29 = !DILocation(line: 29, column: 15, scope: !17)
!30 = !DILocation(line: 29, column: 42, scope: !17)
!31 = !DILocation(line: 29, column: 31, scope: !17)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 30, type: !4)
!33 = !DILocation(line: 30, column: 15, scope: !17)
!34 = !DILocation(line: 30, column: 43, scope: !17)
!35 = !DILocation(line: 30, column: 32, scope: !17)
!36 = !DILocation(line: 33, column: 12, scope: !17)
!37 = !DILocation(line: 33, column: 10, scope: !17)
!38 = !DILocation(line: 35, column: 5, scope: !17)
!39 = !DILocation(line: 35, column: 13, scope: !17)
!40 = !DILocation(line: 36, column: 1, scope: !17)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_65_good", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 58, column: 5, scope: !41)
!43 = !DILocation(line: 59, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 71, type: !45, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !18, line: 71, type: !47)
!52 = !DILocation(line: 71, column: 14, scope: !44)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !18, line: 71, type: !48)
!54 = !DILocation(line: 71, column: 27, scope: !44)
!55 = !DILocation(line: 74, column: 22, scope: !44)
!56 = !DILocation(line: 74, column: 12, scope: !44)
!57 = !DILocation(line: 74, column: 5, scope: !44)
!58 = !DILocation(line: 76, column: 5, scope: !44)
!59 = !DILocation(line: 77, column: 5, scope: !44)
!60 = !DILocation(line: 78, column: 5, scope: !44)
!61 = !DILocation(line: 81, column: 5, scope: !44)
!62 = !DILocation(line: 82, column: 5, scope: !44)
!63 = !DILocation(line: 83, column: 5, scope: !44)
!64 = !DILocation(line: 85, column: 5, scope: !44)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 45, type: !19, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !18, line: 47, type: !4)
!67 = !DILocation(line: 47, column: 15, scope: !65)
!68 = !DILocalVariable(name: "funcPtr", scope: !65, file: !18, line: 48, type: !24)
!69 = !DILocation(line: 48, column: 12, scope: !65)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !18, line: 49, type: !4)
!71 = !DILocation(line: 49, column: 15, scope: !65)
!72 = !DILocation(line: 49, column: 42, scope: !65)
!73 = !DILocation(line: 49, column: 31, scope: !65)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !18, line: 50, type: !4)
!75 = !DILocation(line: 50, column: 15, scope: !65)
!76 = !DILocation(line: 50, column: 43, scope: !65)
!77 = !DILocation(line: 50, column: 32, scope: !65)
!78 = !DILocation(line: 52, column: 12, scope: !65)
!79 = !DILocation(line: 52, column: 10, scope: !65)
!80 = !DILocation(line: 53, column: 5, scope: !65)
!81 = !DILocation(line: 53, column: 13, scope: !65)
!82 = !DILocation(line: 54, column: 1, scope: !65)
