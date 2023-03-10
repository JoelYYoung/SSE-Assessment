; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_54a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_54a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54_bad() #0 !dbg !15 {
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
  %9 = load i32*, i32** %data, align 8, !dbg !39
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54b_badSink(i32* %9), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54_good() #0 !dbg !42 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 200, align 16, !dbg !70
  %1 = bitcast i8* %0 to i32*, !dbg !71
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %2 = alloca i8, i64 400, align 16, !dbg !74
  %3 = bitcast i8* %2 to i32*, !dbg !75
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !73
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !76
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !77
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !80
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !81
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !82
  store i32 0, i32* %arrayidx2, align 4, !dbg !83
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !84
  store i32* %8, i32** %data, align 8, !dbg !85
  %9 = load i32*, i32** %data, align 8, !dbg !86
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54b_goodG2BSink(i32* %9), !dbg !87
  ret void, !dbg !88
}

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_54b_goodG2BSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_54a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_54_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_54a.c", directory: "/home/joelyang/SSE-Assessment")
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
!39 = !DILocation(line: 37, column: 61, scope: !15)
!40 = !DILocation(line: 37, column: 5, scope: !15)
!41 = !DILocation(line: 38, column: 1, scope: !15)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_54_good", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 64, column: 5, scope: !42)
!44 = !DILocation(line: 65, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 77, type: !46, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!7, !7, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !16, line: 77, type: !7)
!52 = !DILocation(line: 77, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !16, line: 77, type: !48)
!54 = !DILocation(line: 77, column: 27, scope: !45)
!55 = !DILocation(line: 80, column: 22, scope: !45)
!56 = !DILocation(line: 80, column: 12, scope: !45)
!57 = !DILocation(line: 80, column: 5, scope: !45)
!58 = !DILocation(line: 82, column: 5, scope: !45)
!59 = !DILocation(line: 83, column: 5, scope: !45)
!60 = !DILocation(line: 84, column: 5, scope: !45)
!61 = !DILocation(line: 87, column: 5, scope: !45)
!62 = !DILocation(line: 88, column: 5, scope: !45)
!63 = !DILocation(line: 89, column: 5, scope: !45)
!64 = !DILocation(line: 91, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !16, line: 50, type: !4)
!67 = !DILocation(line: 50, column: 15, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !16, line: 51, type: !4)
!69 = !DILocation(line: 51, column: 15, scope: !65)
!70 = !DILocation(line: 51, column: 42, scope: !65)
!71 = !DILocation(line: 51, column: 31, scope: !65)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !16, line: 52, type: !4)
!73 = !DILocation(line: 52, column: 15, scope: !65)
!74 = !DILocation(line: 52, column: 43, scope: !65)
!75 = !DILocation(line: 52, column: 32, scope: !65)
!76 = !DILocation(line: 53, column: 13, scope: !65)
!77 = !DILocation(line: 53, column: 5, scope: !65)
!78 = !DILocation(line: 54, column: 5, scope: !65)
!79 = !DILocation(line: 54, column: 25, scope: !65)
!80 = !DILocation(line: 55, column: 13, scope: !65)
!81 = !DILocation(line: 55, column: 5, scope: !65)
!82 = !DILocation(line: 56, column: 5, scope: !65)
!83 = !DILocation(line: 56, column: 27, scope: !65)
!84 = !DILocation(line: 58, column: 12, scope: !65)
!85 = !DILocation(line: 58, column: 10, scope: !65)
!86 = !DILocation(line: 59, column: 65, scope: !65)
!87 = !DILocation(line: 59, column: 5, scope: !65)
!88 = !DILocation(line: 60, column: 1, scope: !65)
