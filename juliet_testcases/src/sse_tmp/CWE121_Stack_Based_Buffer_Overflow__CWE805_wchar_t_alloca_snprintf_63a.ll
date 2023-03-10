; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63_bad() #0 !dbg !15 {
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
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63b_badSink(i32** %data), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63b_badSink(i32**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63_good() #0 !dbg !35 {
entry:
  call void @goodG2B(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i64 @time(i64* null) #4, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !49
  call void @srand(i32 %conv) #4, !dbg !50
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63_good(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63_bad(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !58 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = alloca i8, i64 200, align 16, !dbg !63
  %1 = bitcast i8* %0 to i32*, !dbg !64
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %2 = alloca i8, i64 400, align 16, !dbg !67
  %3 = bitcast i8* %2 to i32*, !dbg !68
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !66
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !69
  store i32* %4, i32** %data, align 8, !dbg !70
  %5 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63b_goodG2BSink(i32** %data), !dbg !73
  ret void, !dbg !74
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63b_goodG2BSink(i32**) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63_bad", scope: !16, file: !16, line: 32, type: !17, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 35, type: !4)
!22 = !DILocation(line: 35, column: 15, scope: !15)
!23 = !DILocation(line: 35, column: 42, scope: !15)
!24 = !DILocation(line: 35, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 36, type: !4)
!26 = !DILocation(line: 36, column: 15, scope: !15)
!27 = !DILocation(line: 36, column: 43, scope: !15)
!28 = !DILocation(line: 36, column: 32, scope: !15)
!29 = !DILocation(line: 39, column: 12, scope: !15)
!30 = !DILocation(line: 39, column: 10, scope: !15)
!31 = !DILocation(line: 40, column: 5, scope: !15)
!32 = !DILocation(line: 40, column: 13, scope: !15)
!33 = !DILocation(line: 41, column: 5, scope: !15)
!34 = !DILocation(line: 42, column: 1, scope: !15)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_63_good", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 64, column: 5, scope: !35)
!37 = !DILocation(line: 65, column: 1, scope: !35)
!38 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 77, type: !39, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!7, !7, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !16, line: 77, type: !7)
!45 = !DILocation(line: 77, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !16, line: 77, type: !41)
!47 = !DILocation(line: 77, column: 27, scope: !38)
!48 = !DILocation(line: 80, column: 22, scope: !38)
!49 = !DILocation(line: 80, column: 12, scope: !38)
!50 = !DILocation(line: 80, column: 5, scope: !38)
!51 = !DILocation(line: 82, column: 5, scope: !38)
!52 = !DILocation(line: 83, column: 5, scope: !38)
!53 = !DILocation(line: 84, column: 5, scope: !38)
!54 = !DILocation(line: 87, column: 5, scope: !38)
!55 = !DILocation(line: 88, column: 5, scope: !38)
!56 = !DILocation(line: 89, column: 5, scope: !38)
!57 = !DILocation(line: 91, column: 5, scope: !38)
!58 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !16, line: 53, type: !4)
!60 = !DILocation(line: 53, column: 15, scope: !58)
!61 = !DILocalVariable(name: "dataBadBuffer", scope: !58, file: !16, line: 54, type: !4)
!62 = !DILocation(line: 54, column: 15, scope: !58)
!63 = !DILocation(line: 54, column: 42, scope: !58)
!64 = !DILocation(line: 54, column: 31, scope: !58)
!65 = !DILocalVariable(name: "dataGoodBuffer", scope: !58, file: !16, line: 55, type: !4)
!66 = !DILocation(line: 55, column: 15, scope: !58)
!67 = !DILocation(line: 55, column: 43, scope: !58)
!68 = !DILocation(line: 55, column: 32, scope: !58)
!69 = !DILocation(line: 57, column: 12, scope: !58)
!70 = !DILocation(line: 57, column: 10, scope: !58)
!71 = !DILocation(line: 58, column: 5, scope: !58)
!72 = !DILocation(line: 58, column: 13, scope: !58)
!73 = !DILocation(line: 59, column: 5, scope: !58)
!74 = !DILocation(line: 60, column: 1, scope: !58)
