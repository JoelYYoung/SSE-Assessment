; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #4, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54b_badSink(i32* %5), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call i64 @time(i64* null) #4, !dbg !47
  %conv = trunc i64 %call to i32, !dbg !48
  call void @srand(i32 %conv) #4, !dbg !49
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54_good(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54_bad(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = alloca i8, i64 400, align 16, !dbg !62
  %1 = bitcast i8* %0 to i32*, !dbg !63
  store i32* %1, i32** %dataBuffer, align 8, !dbg !61
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  store i32* %2, i32** %data, align 8, !dbg !65
  %3 = load i32*, i32** %data, align 8, !dbg !66
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #4, !dbg !67
  %4 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  %5 = load i32*, i32** %data, align 8, !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54b_goodG2BSink(i32* %5), !dbg !71
  ret void, !dbg !72
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54b_goodG2BSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 29, type: !4)
!22 = !DILocation(line: 29, column: 15, scope: !15)
!23 = !DILocation(line: 29, column: 39, scope: !15)
!24 = !DILocation(line: 29, column: 28, scope: !15)
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocation(line: 32, column: 13, scope: !15)
!28 = !DILocation(line: 32, column: 5, scope: !15)
!29 = !DILocation(line: 33, column: 5, scope: !15)
!30 = !DILocation(line: 33, column: 17, scope: !15)
!31 = !DILocation(line: 34, column: 76, scope: !15)
!32 = !DILocation(line: 34, column: 5, scope: !15)
!33 = !DILocation(line: 35, column: 1, scope: !15)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_54_good", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 58, column: 5, scope: !34)
!36 = !DILocation(line: 59, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 71, type: !38, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!7, !7, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !16, line: 71, type: !7)
!44 = !DILocation(line: 71, column: 14, scope: !37)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !16, line: 71, type: !40)
!46 = !DILocation(line: 71, column: 27, scope: !37)
!47 = !DILocation(line: 74, column: 22, scope: !37)
!48 = !DILocation(line: 74, column: 12, scope: !37)
!49 = !DILocation(line: 74, column: 5, scope: !37)
!50 = !DILocation(line: 76, column: 5, scope: !37)
!51 = !DILocation(line: 77, column: 5, scope: !37)
!52 = !DILocation(line: 78, column: 5, scope: !37)
!53 = !DILocation(line: 81, column: 5, scope: !37)
!54 = !DILocation(line: 82, column: 5, scope: !37)
!55 = !DILocation(line: 83, column: 5, scope: !37)
!56 = !DILocation(line: 85, column: 5, scope: !37)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 45, type: !17, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !16, line: 47, type: !4)
!59 = !DILocation(line: 47, column: 15, scope: !57)
!60 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !16, line: 48, type: !4)
!61 = !DILocation(line: 48, column: 15, scope: !57)
!62 = !DILocation(line: 48, column: 39, scope: !57)
!63 = !DILocation(line: 48, column: 28, scope: !57)
!64 = !DILocation(line: 49, column: 12, scope: !57)
!65 = !DILocation(line: 49, column: 10, scope: !57)
!66 = !DILocation(line: 51, column: 13, scope: !57)
!67 = !DILocation(line: 51, column: 5, scope: !57)
!68 = !DILocation(line: 52, column: 5, scope: !57)
!69 = !DILocation(line: 52, column: 16, scope: !57)
!70 = !DILocation(line: 53, column: 80, scope: !57)
!71 = !DILocation(line: 53, column: 5, scope: !57)
!72 = !DILocation(line: 54, column: 1, scope: !57)
