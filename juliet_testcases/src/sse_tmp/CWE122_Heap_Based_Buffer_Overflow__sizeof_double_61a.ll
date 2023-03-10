; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_bad() #0 !dbg !11 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store double* null, double** %data, align 8, !dbg !19
  %0 = load double*, double** %data, align 8, !dbg !20
  %call = call double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61b_badSource(double* %0), !dbg !21
  store double* %call, double** %data, align 8, !dbg !22
  %1 = load double*, double** %data, align 8, !dbg !23
  %2 = load double, double* %1, align 8, !dbg !24
  call void @printDoubleLine(double %2), !dbg !25
  %3 = load double*, double** %data, align 8, !dbg !26
  %4 = bitcast double* %3 to i8*, !dbg !26
  call void @free(i8* %4) #4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61b_badSource(double*) #2

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_good() #0 !dbg !29 {
entry:
  call void @goodG2B(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !32 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_good(), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !49
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_bad(), !dbg !50
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
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !54, metadata !DIExpression()), !dbg !55
  store double* null, double** %data, align 8, !dbg !56
  %0 = load double*, double** %data, align 8, !dbg !57
  %call = call double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61b_goodG2BSource(double* %0), !dbg !58
  store double* %call, double** %data, align 8, !dbg !59
  %1 = load double*, double** %data, align 8, !dbg !60
  %2 = load double, double* %1, align 8, !dbg !61
  call void @printDoubleLine(double %2), !dbg !62
  %3 = load double*, double** %data, align 8, !dbg !63
  %4 = bitcast double* %3 to i8*, !dbg !63
  call void @free(i8* %4) #4, !dbg !64
  ret void, !dbg !65
}

declare dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61b_goodG2BSource(double*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!18 = !DILocation(line: 26, column: 14, scope: !11)
!19 = !DILocation(line: 28, column: 10, scope: !11)
!20 = !DILocation(line: 29, column: 75, scope: !11)
!21 = !DILocation(line: 29, column: 12, scope: !11)
!22 = !DILocation(line: 29, column: 10, scope: !11)
!23 = !DILocation(line: 31, column: 22, scope: !11)
!24 = !DILocation(line: 31, column: 21, scope: !11)
!25 = !DILocation(line: 31, column: 5, scope: !11)
!26 = !DILocation(line: 32, column: 10, scope: !11)
!27 = !DILocation(line: 32, column: 5, scope: !11)
!28 = !DILocation(line: 33, column: 1, scope: !11)
!29 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_good", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 55, column: 5, scope: !29)
!31 = !DILocation(line: 56, column: 1, scope: !29)
!32 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 68, type: !33, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35, !36}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !12, line: 68, type: !35)
!40 = !DILocation(line: 68, column: 14, scope: !32)
!41 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !12, line: 68, type: !36)
!42 = !DILocation(line: 68, column: 27, scope: !32)
!43 = !DILocation(line: 71, column: 22, scope: !32)
!44 = !DILocation(line: 71, column: 12, scope: !32)
!45 = !DILocation(line: 71, column: 5, scope: !32)
!46 = !DILocation(line: 73, column: 5, scope: !32)
!47 = !DILocation(line: 74, column: 5, scope: !32)
!48 = !DILocation(line: 75, column: 5, scope: !32)
!49 = !DILocation(line: 78, column: 5, scope: !32)
!50 = !DILocation(line: 79, column: 5, scope: !32)
!51 = !DILocation(line: 80, column: 5, scope: !32)
!52 = !DILocation(line: 82, column: 5, scope: !32)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", scope: !53, file: !12, line: 44, type: !16)
!55 = !DILocation(line: 44, column: 14, scope: !53)
!56 = !DILocation(line: 46, column: 10, scope: !53)
!57 = !DILocation(line: 47, column: 79, scope: !53)
!58 = !DILocation(line: 47, column: 12, scope: !53)
!59 = !DILocation(line: 47, column: 10, scope: !53)
!60 = !DILocation(line: 49, column: 22, scope: !53)
!61 = !DILocation(line: 49, column: 21, scope: !53)
!62 = !DILocation(line: 49, column: 5, scope: !53)
!63 = !DILocation(line: 50, column: 10, scope: !53)
!64 = !DILocation(line: 50, column: 5, scope: !53)
!65 = !DILocation(line: 51, column: 1, scope: !53)
