; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_badData = dso_local global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_goodG2BData = dso_local global i64* null, align 8, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
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
  %5 = load i64*, i64** %data, align 8, !dbg !38
  store i64* %5, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_badData, align 8, !dbg !39
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68b_badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #4, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #4, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 400, align 16, !dbg !71
  %1 = bitcast i8* %0 to i64*, !dbg !72
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 800, align 16, !dbg !75
  %3 = bitcast i8* %2 to i64*, !dbg !76
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !74
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !77
  store i64* %4, i64** %data, align 8, !dbg !78
  %5 = load i64*, i64** %data, align 8, !dbg !79
  store i64* %5, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_goodG2BData, align 8, !dbg !80
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68b_goodG2BSink(), !dbg !81
  ret void, !dbg !82
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_badData", scope: !2, file: !16, line: 19, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_goodG2BData", scope: !2, file: !16, line: 20, type: !6, isLocal: false, isDefinition: true)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_bad", scope: !16, file: !16, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !16, line: 29, type: !6)
!27 = !DILocation(line: 29, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !16, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 15, scope: !23)
!30 = !DILocation(line: 30, column: 42, scope: !23)
!31 = !DILocation(line: 30, column: 31, scope: !23)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !16, line: 31, type: !6)
!33 = !DILocation(line: 31, column: 15, scope: !23)
!34 = !DILocation(line: 31, column: 43, scope: !23)
!35 = !DILocation(line: 31, column: 32, scope: !23)
!36 = !DILocation(line: 34, column: 12, scope: !23)
!37 = !DILocation(line: 34, column: 10, scope: !23)
!38 = !DILocation(line: 35, column: 83, scope: !23)
!39 = !DILocation(line: 35, column: 81, scope: !23)
!40 = !DILocation(line: 36, column: 5, scope: !23)
!41 = !DILocation(line: 37, column: 1, scope: !23)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_68_good", scope: !16, file: !16, line: 58, type: !24, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 60, column: 5, scope: !42)
!44 = !DILocation(line: 61, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 73, type: !46, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !16, line: 73, type: !48)
!53 = !DILocation(line: 73, column: 14, scope: !45)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !16, line: 73, type: !49)
!55 = !DILocation(line: 73, column: 27, scope: !45)
!56 = !DILocation(line: 76, column: 22, scope: !45)
!57 = !DILocation(line: 76, column: 12, scope: !45)
!58 = !DILocation(line: 76, column: 5, scope: !45)
!59 = !DILocation(line: 78, column: 5, scope: !45)
!60 = !DILocation(line: 79, column: 5, scope: !45)
!61 = !DILocation(line: 80, column: 5, scope: !45)
!62 = !DILocation(line: 83, column: 5, scope: !45)
!63 = !DILocation(line: 84, column: 5, scope: !45)
!64 = !DILocation(line: 85, column: 5, scope: !45)
!65 = !DILocation(line: 87, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !24, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !16, line: 49, type: !6)
!68 = !DILocation(line: 49, column: 15, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !16, line: 50, type: !6)
!70 = !DILocation(line: 50, column: 15, scope: !66)
!71 = !DILocation(line: 50, column: 42, scope: !66)
!72 = !DILocation(line: 50, column: 31, scope: !66)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !16, line: 51, type: !6)
!74 = !DILocation(line: 51, column: 15, scope: !66)
!75 = !DILocation(line: 51, column: 43, scope: !66)
!76 = !DILocation(line: 51, column: 32, scope: !66)
!77 = !DILocation(line: 53, column: 12, scope: !66)
!78 = !DILocation(line: 53, column: 10, scope: !66)
!79 = !DILocation(line: 54, column: 87, scope: !66)
!80 = !DILocation(line: 54, column: 85, scope: !66)
!81 = !DILocation(line: 55, column: 5, scope: !66)
!82 = !DILocation(line: 56, column: 1, scope: !66)
