; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_63a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %8, i32** %data, align 8, !dbg !38
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63b_badSink(i32** %data), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63_good() #0 !dbg !41 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = alloca i8, i64 200, align 16, !dbg !69
  %1 = bitcast i8* %0 to i32*, !dbg !70
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %2 = alloca i8, i64 400, align 16, !dbg !73
  %3 = bitcast i8* %2 to i32*, !dbg !74
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !72
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !75
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !76
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !79
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !80
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !81
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !81
  store i32 0, i32* %arrayidx2, align 4, !dbg !82
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !83
  store i32* %8, i32** %data, align 8, !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63b_goodG2BSink(i32** %data), !dbg !85
  ret void, !dbg !86
}

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_63b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_63_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 29, type: !4)
!22 = !DILocation(line: 29, column: 15, scope: !15)
!23 = !DILocation(line: 29, column: 42, scope: !15)
!24 = !DILocation(line: 29, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 30, type: !4)
!26 = !DILocation(line: 30, column: 15, scope: !15)
!27 = !DILocation(line: 30, column: 43, scope: !15)
!28 = !DILocation(line: 30, column: 32, scope: !15)
!29 = !DILocation(line: 31, column: 13, scope: !15)
!30 = !DILocation(line: 31, column: 5, scope: !15)
!31 = !DILocation(line: 32, column: 5, scope: !15)
!32 = !DILocation(line: 32, column: 25, scope: !15)
!33 = !DILocation(line: 33, column: 13, scope: !15)
!34 = !DILocation(line: 33, column: 5, scope: !15)
!35 = !DILocation(line: 34, column: 5, scope: !15)
!36 = !DILocation(line: 34, column: 27, scope: !15)
!37 = !DILocation(line: 36, column: 12, scope: !15)
!38 = !DILocation(line: 36, column: 10, scope: !15)
!39 = !DILocation(line: 37, column: 5, scope: !15)
!40 = !DILocation(line: 38, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_63_good", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 63, column: 5, scope: !41)
!43 = !DILocation(line: 64, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 76, type: !45, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!7, !7, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !16, line: 76, type: !7)
!51 = !DILocation(line: 76, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !16, line: 76, type: !47)
!53 = !DILocation(line: 76, column: 27, scope: !44)
!54 = !DILocation(line: 79, column: 22, scope: !44)
!55 = !DILocation(line: 79, column: 12, scope: !44)
!56 = !DILocation(line: 79, column: 5, scope: !44)
!57 = !DILocation(line: 81, column: 5, scope: !44)
!58 = !DILocation(line: 82, column: 5, scope: !44)
!59 = !DILocation(line: 83, column: 5, scope: !44)
!60 = !DILocation(line: 86, column: 5, scope: !44)
!61 = !DILocation(line: 87, column: 5, scope: !44)
!62 = !DILocation(line: 88, column: 5, scope: !44)
!63 = !DILocation(line: 90, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !16, line: 49, type: !4)
!66 = !DILocation(line: 49, column: 15, scope: !64)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !16, line: 50, type: !4)
!68 = !DILocation(line: 50, column: 15, scope: !64)
!69 = !DILocation(line: 50, column: 42, scope: !64)
!70 = !DILocation(line: 50, column: 31, scope: !64)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !16, line: 51, type: !4)
!72 = !DILocation(line: 51, column: 15, scope: !64)
!73 = !DILocation(line: 51, column: 43, scope: !64)
!74 = !DILocation(line: 51, column: 32, scope: !64)
!75 = !DILocation(line: 52, column: 13, scope: !64)
!76 = !DILocation(line: 52, column: 5, scope: !64)
!77 = !DILocation(line: 53, column: 5, scope: !64)
!78 = !DILocation(line: 53, column: 25, scope: !64)
!79 = !DILocation(line: 54, column: 13, scope: !64)
!80 = !DILocation(line: 54, column: 5, scope: !64)
!81 = !DILocation(line: 55, column: 5, scope: !64)
!82 = !DILocation(line: 55, column: 27, scope: !64)
!83 = !DILocation(line: 57, column: 12, scope: !64)
!84 = !DILocation(line: 57, column: 10, scope: !64)
!85 = !DILocation(line: 58, column: 5, scope: !64)
!86 = !DILocation(line: 59, column: 1, scope: !64)
