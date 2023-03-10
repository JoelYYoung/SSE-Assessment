; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataArray = alloca [5 x i64*], align 16
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [5 x i64*]* %dataArray, metadata !23, metadata !DIExpression()), !dbg !27
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
  %arrayidx = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 2, !dbg !39
  store i64* %5, i64** %arrayidx, align 16, !dbg !40
  %arraydecay = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 0, !dbg !41
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66b_badSink(i64** %arraydecay), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66b_badSink(i64**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #4, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #4, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i64*, align 8
  %dataArray = alloca [5 x i64*], align 16
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [5 x i64*]* %dataArray, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 400, align 16, !dbg !75
  %1 = bitcast i8* %0 to i64*, !dbg !76
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = alloca i8, i64 800, align 16, !dbg !79
  %3 = bitcast i8* %2 to i64*, !dbg !80
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !78
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !81
  store i64* %4, i64** %data, align 8, !dbg !82
  %5 = load i64*, i64** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 2, !dbg !84
  store i64* %5, i64** %arrayidx, align 16, !dbg !85
  %arraydecay = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 0, !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66b_goodG2BSink(i64** %arraydecay), !dbg !87
  ret void, !dbg !88
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66b_goodG2BSink(i64**) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66_bad", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataArray", scope: !17, file: !18, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 5)
!27 = !DILocation(line: 27, column: 15, scope: !17)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 28, type: !4)
!29 = !DILocation(line: 28, column: 15, scope: !17)
!30 = !DILocation(line: 28, column: 42, scope: !17)
!31 = !DILocation(line: 28, column: 31, scope: !17)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 29, type: !4)
!33 = !DILocation(line: 29, column: 15, scope: !17)
!34 = !DILocation(line: 29, column: 43, scope: !17)
!35 = !DILocation(line: 29, column: 32, scope: !17)
!36 = !DILocation(line: 32, column: 12, scope: !17)
!37 = !DILocation(line: 32, column: 10, scope: !17)
!38 = !DILocation(line: 34, column: 20, scope: !17)
!39 = !DILocation(line: 34, column: 5, scope: !17)
!40 = !DILocation(line: 34, column: 18, scope: !17)
!41 = !DILocation(line: 35, column: 82, scope: !17)
!42 = !DILocation(line: 35, column: 5, scope: !17)
!43 = !DILocation(line: 36, column: 1, scope: !17)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_66_good", scope: !18, file: !18, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 59, column: 5, scope: !44)
!46 = !DILocation(line: 60, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 72, type: !48, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !18, line: 72, type: !50)
!55 = !DILocation(line: 72, column: 14, scope: !47)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !18, line: 72, type: !51)
!57 = !DILocation(line: 72, column: 27, scope: !47)
!58 = !DILocation(line: 75, column: 22, scope: !47)
!59 = !DILocation(line: 75, column: 12, scope: !47)
!60 = !DILocation(line: 75, column: 5, scope: !47)
!61 = !DILocation(line: 77, column: 5, scope: !47)
!62 = !DILocation(line: 78, column: 5, scope: !47)
!63 = !DILocation(line: 79, column: 5, scope: !47)
!64 = !DILocation(line: 82, column: 5, scope: !47)
!65 = !DILocation(line: 83, column: 5, scope: !47)
!66 = !DILocation(line: 84, column: 5, scope: !47)
!67 = !DILocation(line: 86, column: 5, scope: !47)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 45, type: !19, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !18, line: 47, type: !4)
!70 = !DILocation(line: 47, column: 15, scope: !68)
!71 = !DILocalVariable(name: "dataArray", scope: !68, file: !18, line: 48, type: !24)
!72 = !DILocation(line: 48, column: 15, scope: !68)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !18, line: 49, type: !4)
!74 = !DILocation(line: 49, column: 15, scope: !68)
!75 = !DILocation(line: 49, column: 42, scope: !68)
!76 = !DILocation(line: 49, column: 31, scope: !68)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !18, line: 50, type: !4)
!78 = !DILocation(line: 50, column: 15, scope: !68)
!79 = !DILocation(line: 50, column: 43, scope: !68)
!80 = !DILocation(line: 50, column: 32, scope: !68)
!81 = !DILocation(line: 52, column: 12, scope: !68)
!82 = !DILocation(line: 52, column: 10, scope: !68)
!83 = !DILocation(line: 53, column: 20, scope: !68)
!84 = !DILocation(line: 53, column: 5, scope: !68)
!85 = !DILocation(line: 53, column: 18, scope: !68)
!86 = !DILocation(line: 54, column: 86, scope: !68)
!87 = !DILocation(line: 54, column: 5, scope: !68)
!88 = !DILocation(line: 55, column: 1, scope: !68)
