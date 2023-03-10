; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !41
  store i32* %1, i32** %arrayidx1, align 16, !dbg !42
  %arraydecay2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !43
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66b_badSink(i32** %arraydecay2), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66b_badSink(i32**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #4, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #4, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  store i32* %arraydecay, i32** %data, align 8, !dbg !79
  %0 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %1 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !83
  store i32* %1, i32** %arrayidx1, align 16, !dbg !84
  %arraydecay2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66b_goodG2BSink(i32** %arraydecay2), !dbg !86
  ret void, !dbg !87
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66b_goodG2BSink(i32**) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataArray", scope: !11, file: !12, line: 34, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 34, column: 15, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 35, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 35, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 36, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 36, column: 13, scope: !11)
!36 = !DILocation(line: 39, column: 12, scope: !11)
!37 = !DILocation(line: 39, column: 10, scope: !11)
!38 = !DILocation(line: 40, column: 5, scope: !11)
!39 = !DILocation(line: 40, column: 13, scope: !11)
!40 = !DILocation(line: 42, column: 20, scope: !11)
!41 = !DILocation(line: 42, column: 5, scope: !11)
!42 = !DILocation(line: 42, column: 18, scope: !11)
!43 = !DILocation(line: 43, column: 81, scope: !11)
!44 = !DILocation(line: 43, column: 5, scope: !11)
!45 = !DILocation(line: 44, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_66_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 69, column: 5, scope: !46)
!48 = !DILocation(line: 70, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !50, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!19, !19, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 82, type: !19)
!56 = !DILocation(line: 82, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 82, type: !52)
!58 = !DILocation(line: 82, column: 27, scope: !49)
!59 = !DILocation(line: 85, column: 22, scope: !49)
!60 = !DILocation(line: 85, column: 12, scope: !49)
!61 = !DILocation(line: 85, column: 5, scope: !49)
!62 = !DILocation(line: 87, column: 5, scope: !49)
!63 = !DILocation(line: 88, column: 5, scope: !49)
!64 = !DILocation(line: 89, column: 5, scope: !49)
!65 = !DILocation(line: 92, column: 5, scope: !49)
!66 = !DILocation(line: 93, column: 5, scope: !49)
!67 = !DILocation(line: 94, column: 5, scope: !49)
!68 = !DILocation(line: 96, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 55, type: !16)
!71 = !DILocation(line: 55, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataArray", scope: !69, file: !12, line: 56, type: !22)
!73 = !DILocation(line: 56, column: 15, scope: !69)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 57, type: !27)
!75 = !DILocation(line: 57, column: 13, scope: !69)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 58, type: !32)
!77 = !DILocation(line: 58, column: 13, scope: !69)
!78 = !DILocation(line: 61, column: 12, scope: !69)
!79 = !DILocation(line: 61, column: 10, scope: !69)
!80 = !DILocation(line: 62, column: 5, scope: !69)
!81 = !DILocation(line: 62, column: 13, scope: !69)
!82 = !DILocation(line: 63, column: 20, scope: !69)
!83 = !DILocation(line: 63, column: 5, scope: !69)
!84 = !DILocation(line: 63, column: 18, scope: !69)
!85 = !DILocation(line: 64, column: 85, scope: !69)
!86 = !DILocation(line: 64, column: 5, scope: !69)
!87 = !DILocation(line: 65, column: 1, scope: !69)
