; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_bad() #0 !dbg !13 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store double* null, double** %data, align 8, !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !20
  %0 = bitcast i8* %call to double*, !dbg !21
  store double* %0, double** %data, align 8, !dbg !22
  %1 = load double*, double** %data, align 8, !dbg !23
  store double 1.700000e+300, double* %1, align 8, !dbg !24
  %2 = load double*, double** %data, align 8, !dbg !25
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51b_badSink(double* %2), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51b_badSink(double*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_good() #0 !dbg !28 {
entry:
  call void @goodG2B(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !38, metadata !DIExpression()), !dbg !39
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %call = call i64 @time(i64* null) #4, !dbg !42
  %conv = trunc i64 %call to i32, !dbg !43
  call void @srand(i32 %conv) #4, !dbg !44
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !45
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_good(), !dbg !46
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !48
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_bad(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !50
  ret i32 0, !dbg !51
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !52 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !53, metadata !DIExpression()), !dbg !54
  store double* null, double** %data, align 8, !dbg !55
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !56
  %0 = bitcast i8* %call to double*, !dbg !57
  store double* %0, double** %data, align 8, !dbg !58
  %1 = load double*, double** %data, align 8, !dbg !59
  store double 1.700000e+300, double* %1, align 8, !dbg !60
  %2 = load double*, double** %data, align 8, !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51b_goodG2BSink(double* %2), !dbg !62
  ret void, !dbg !63
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51b_goodG2BSink(double*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_bad", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 14, scope: !13)
!19 = !DILocation(line: 28, column: 10, scope: !13)
!20 = !DILocation(line: 31, column: 22, scope: !13)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 10, scope: !13)
!23 = !DILocation(line: 32, column: 6, scope: !13)
!24 = !DILocation(line: 32, column: 11, scope: !13)
!25 = !DILocation(line: 33, column: 66, scope: !13)
!26 = !DILocation(line: 33, column: 5, scope: !13)
!27 = !DILocation(line: 34, column: 1, scope: !13)
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_good", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 57, column: 5, scope: !28)
!30 = !DILocation(line: 58, column: 1, scope: !28)
!31 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 70, type: !32, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !14, line: 70, type: !34)
!39 = !DILocation(line: 70, column: 14, scope: !31)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !14, line: 70, type: !35)
!41 = !DILocation(line: 70, column: 27, scope: !31)
!42 = !DILocation(line: 73, column: 22, scope: !31)
!43 = !DILocation(line: 73, column: 12, scope: !31)
!44 = !DILocation(line: 73, column: 5, scope: !31)
!45 = !DILocation(line: 75, column: 5, scope: !31)
!46 = !DILocation(line: 76, column: 5, scope: !31)
!47 = !DILocation(line: 77, column: 5, scope: !31)
!48 = !DILocation(line: 80, column: 5, scope: !31)
!49 = !DILocation(line: 81, column: 5, scope: !31)
!50 = !DILocation(line: 82, column: 5, scope: !31)
!51 = !DILocation(line: 84, column: 5, scope: !31)
!52 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", scope: !52, file: !14, line: 46, type: !4)
!54 = !DILocation(line: 46, column: 14, scope: !52)
!55 = !DILocation(line: 48, column: 10, scope: !52)
!56 = !DILocation(line: 50, column: 22, scope: !52)
!57 = !DILocation(line: 50, column: 12, scope: !52)
!58 = !DILocation(line: 50, column: 10, scope: !52)
!59 = !DILocation(line: 51, column: 6, scope: !52)
!60 = !DILocation(line: 51, column: 11, scope: !52)
!61 = !DILocation(line: 52, column: 70, scope: !52)
!62 = !DILocation(line: 52, column: 5, scope: !52)
!63 = !DILocation(line: 53, column: 1, scope: !52)
