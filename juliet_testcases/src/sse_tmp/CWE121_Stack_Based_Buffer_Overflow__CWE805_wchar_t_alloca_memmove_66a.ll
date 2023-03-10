; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !39
  store i32* %6, i32** %arrayidx1, align 16, !dbg !40
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !41
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66b_badSink(i32** %arraydecay), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66b_badSink(i32**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66_good() #0 !dbg !44 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #4, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #4, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 200, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = alloca i8, i64 400, align 16, !dbg !78
  %3 = bitcast i8* %2 to i32*, !dbg !79
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !77
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !80
  store i32* %4, i32** %data, align 8, !dbg !81
  %5 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !85
  store i32* %6, i32** %arrayidx1, align 16, !dbg !86
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66b_goodG2BSink(i32** %arraydecay), !dbg !88
  ret void, !dbg !89
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66b_goodG2BSink(i32**) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataArray", scope: !15, file: !16, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 29, column: 15, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 30, type: !4)
!27 = !DILocation(line: 30, column: 15, scope: !15)
!28 = !DILocation(line: 30, column: 42, scope: !15)
!29 = !DILocation(line: 30, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 31, type: !4)
!31 = !DILocation(line: 31, column: 15, scope: !15)
!32 = !DILocation(line: 31, column: 43, scope: !15)
!33 = !DILocation(line: 31, column: 32, scope: !15)
!34 = !DILocation(line: 34, column: 12, scope: !15)
!35 = !DILocation(line: 34, column: 10, scope: !15)
!36 = !DILocation(line: 35, column: 5, scope: !15)
!37 = !DILocation(line: 35, column: 13, scope: !15)
!38 = !DILocation(line: 37, column: 20, scope: !15)
!39 = !DILocation(line: 37, column: 5, scope: !15)
!40 = !DILocation(line: 37, column: 18, scope: !15)
!41 = !DILocation(line: 38, column: 83, scope: !15)
!42 = !DILocation(line: 38, column: 5, scope: !15)
!43 = !DILocation(line: 39, column: 1, scope: !15)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_66_good", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 63, column: 5, scope: !44)
!46 = !DILocation(line: 64, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 76, type: !48, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!7, !7, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !16, line: 76, type: !7)
!54 = !DILocation(line: 76, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !16, line: 76, type: !50)
!56 = !DILocation(line: 76, column: 27, scope: !47)
!57 = !DILocation(line: 79, column: 22, scope: !47)
!58 = !DILocation(line: 79, column: 12, scope: !47)
!59 = !DILocation(line: 79, column: 5, scope: !47)
!60 = !DILocation(line: 81, column: 5, scope: !47)
!61 = !DILocation(line: 82, column: 5, scope: !47)
!62 = !DILocation(line: 83, column: 5, scope: !47)
!63 = !DILocation(line: 86, column: 5, scope: !47)
!64 = !DILocation(line: 87, column: 5, scope: !47)
!65 = !DILocation(line: 88, column: 5, scope: !47)
!66 = !DILocation(line: 90, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !16, line: 50, type: !4)
!69 = !DILocation(line: 50, column: 15, scope: !67)
!70 = !DILocalVariable(name: "dataArray", scope: !67, file: !16, line: 51, type: !22)
!71 = !DILocation(line: 51, column: 15, scope: !67)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !67, file: !16, line: 52, type: !4)
!73 = !DILocation(line: 52, column: 15, scope: !67)
!74 = !DILocation(line: 52, column: 42, scope: !67)
!75 = !DILocation(line: 52, column: 31, scope: !67)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !67, file: !16, line: 53, type: !4)
!77 = !DILocation(line: 53, column: 15, scope: !67)
!78 = !DILocation(line: 53, column: 43, scope: !67)
!79 = !DILocation(line: 53, column: 32, scope: !67)
!80 = !DILocation(line: 55, column: 12, scope: !67)
!81 = !DILocation(line: 55, column: 10, scope: !67)
!82 = !DILocation(line: 56, column: 5, scope: !67)
!83 = !DILocation(line: 56, column: 13, scope: !67)
!84 = !DILocation(line: 57, column: 20, scope: !67)
!85 = !DILocation(line: 57, column: 5, scope: !67)
!86 = !DILocation(line: 57, column: 18, scope: !67)
!87 = !DILocation(line: 58, column: 87, scope: !67)
!88 = !DILocation(line: 58, column: 5, scope: !67)
!89 = !DILocation(line: 59, column: 1, scope: !67)
