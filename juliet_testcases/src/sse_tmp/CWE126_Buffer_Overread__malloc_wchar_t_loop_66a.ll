; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 49) #4, !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !35
  store i32* %3, i32** %arrayidx2, align 16, !dbg !36
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !37
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_badSink(i32** %arraydecay), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #4, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #4, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !66, metadata !DIExpression()), !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !69
  %0 = bitcast i8* %call to i32*, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !71
  %1 = load i32*, i32** %data, align 8, !dbg !72
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !77
  store i32* %3, i32** %arrayidx2, align 16, !dbg !78
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !79
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_goodG2BSink(i32** %arraydecay), !dbg !80
  ret void, !dbg !81
}

declare dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_66_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataArray", scope: !15, file: !16, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 29, column: 15, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocation(line: 32, column: 23, scope: !15)
!28 = !DILocation(line: 32, column: 12, scope: !15)
!29 = !DILocation(line: 32, column: 10, scope: !15)
!30 = !DILocation(line: 33, column: 13, scope: !15)
!31 = !DILocation(line: 33, column: 5, scope: !15)
!32 = !DILocation(line: 34, column: 5, scope: !15)
!33 = !DILocation(line: 34, column: 16, scope: !15)
!34 = !DILocation(line: 36, column: 20, scope: !15)
!35 = !DILocation(line: 36, column: 5, scope: !15)
!36 = !DILocation(line: 36, column: 18, scope: !15)
!37 = !DILocation(line: 37, column: 61, scope: !15)
!38 = !DILocation(line: 37, column: 5, scope: !15)
!39 = !DILocation(line: 38, column: 1, scope: !15)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_66_good", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 62, column: 5, scope: !40)
!42 = !DILocation(line: 63, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 75, type: !44, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!7, !7, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !16, line: 75, type: !7)
!50 = !DILocation(line: 75, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !16, line: 75, type: !46)
!52 = !DILocation(line: 75, column: 27, scope: !43)
!53 = !DILocation(line: 78, column: 22, scope: !43)
!54 = !DILocation(line: 78, column: 12, scope: !43)
!55 = !DILocation(line: 78, column: 5, scope: !43)
!56 = !DILocation(line: 80, column: 5, scope: !43)
!57 = !DILocation(line: 81, column: 5, scope: !43)
!58 = !DILocation(line: 82, column: 5, scope: !43)
!59 = !DILocation(line: 85, column: 5, scope: !43)
!60 = !DILocation(line: 86, column: 5, scope: !43)
!61 = !DILocation(line: 87, column: 5, scope: !43)
!62 = !DILocation(line: 89, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !16, line: 49, type: !4)
!65 = !DILocation(line: 49, column: 15, scope: !63)
!66 = !DILocalVariable(name: "dataArray", scope: !63, file: !16, line: 50, type: !22)
!67 = !DILocation(line: 50, column: 15, scope: !63)
!68 = !DILocation(line: 51, column: 10, scope: !63)
!69 = !DILocation(line: 53, column: 23, scope: !63)
!70 = !DILocation(line: 53, column: 12, scope: !63)
!71 = !DILocation(line: 53, column: 10, scope: !63)
!72 = !DILocation(line: 54, column: 13, scope: !63)
!73 = !DILocation(line: 54, column: 5, scope: !63)
!74 = !DILocation(line: 55, column: 5, scope: !63)
!75 = !DILocation(line: 55, column: 17, scope: !63)
!76 = !DILocation(line: 56, column: 20, scope: !63)
!77 = !DILocation(line: 56, column: 5, scope: !63)
!78 = !DILocation(line: 56, column: 18, scope: !63)
!79 = !DILocation(line: 57, column: 65, scope: !63)
!80 = !DILocation(line: 57, column: 5, scope: !63)
!81 = !DILocation(line: 58, column: 1, scope: !63)
